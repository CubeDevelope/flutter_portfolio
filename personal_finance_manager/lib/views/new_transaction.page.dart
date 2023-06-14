import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';
import 'package:personal_finance_manager/utils/constants.dart';
import 'package:personal_finance_manager/views/components/scaffold_provider.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  Transaction transaction = Transaction();

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
    return ScaffoldProvider(
      actions: (p0) {
        List<Widget> actions = [];
        actions.add(IconButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _amountController.text.isNotEmpty &&
                double.tryParse(_amountController.text) != null) {
              transaction.titleOfTransaction = _titleController.text;
              transaction.amountOfTransaction =
                  double.parse(_amountController.text);

              p0.addTransaction(transaction);
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
      child: () {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildInputField(_titleController, "Titolo della transazione"),
              _buildInputField(
                  _amountController, "Valore della transazione in €",
                  type: TextInputType.number),
              //Qui verrà inserito il titolo della transazione
            ],
          ),
        );
      },
      builder: (context, appProvider, child) {
        if (appProvider.selectedTransaction != null) {
          transaction = appProvider.selectedTransaction!;
        }

        _titleController.text = transaction.titleOfTransaction;
        _amountController.text = transaction.amountOfTransaction.toString();
        return child!;
      },
    );
  }
}
