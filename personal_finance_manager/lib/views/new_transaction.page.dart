import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_manager/business_logic/cubit/new_transaction.cubit.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';
import 'package:personal_finance_manager/utils/constants.dart';
import 'package:personal_finance_manager/views/components/new_category.button.dart';
import 'package:personal_finance_manager/views/components/scaffold_provider.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  Widget _buildInputField(TextEditingController controller, String hint,
      {TextInputType? type}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: TextField(
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration.collapsed(hintText: hint),
              style: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<NewTransactionCubit>(
      cubit: NewTransactionCubit(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      actions: (cubit) {
        List<Widget> actions = [];
        actions.add(IconButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _amountController.text.isNotEmpty &&
                double.tryParse(_amountController.text) != null) {
              cubit.transaction.titleOfTransaction = _titleController.text;
              cubit.transaction.amountOfTransaction =
                  double.parse(_amountController.text);

              cubit.addTransaction();
              Navigator.pop(context);
            }

            if (double.tryParse(_amountController.text) == null) {
              _amountController.clear();
            }
          },
          icon: const Icon(Icons.save),
        ));

        return actions;
      },
      title: "New Transaction",
      builder: (cubit, state) {
        _titleController.text = cubit.transaction.titleOfTransaction;
        _amountController.text =
            cubit.transaction.amountOfTransaction.toString();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(_titleController, "Titolo della transazione"),
            _buildInputField(_amountController, "Valore della transazione in €",
                type: TextInputType.number),
            const NewCategoryButton(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Container(
              key: const Key('cotegories_list_viwer'),
            )
          ],
        );
      },
    );
  }
}
