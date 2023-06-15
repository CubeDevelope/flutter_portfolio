import 'package:flutter/material.dart';
import 'package:personal_finance_manager/business_logic/cubit/new_transaction.cubit.dart';
import 'package:personal_finance_manager/business_logic/cubit/transaction_detalis.cubit.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';
import 'package:personal_finance_manager/utils/router.dart';
import 'package:personal_finance_manager/views/components/scaffold_provider.dart';
import 'package:personal_finance_manager/views/new_transaction.page.dart';

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage({super.key});

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {


  @override
  Widget build(BuildContext context) {
    return AppScaffold<TransactionDetailsCubit>(
      cubit: TransactionDetailsCubit(),
      title: "Dettagli transazione",
      actions: (cubit) {
        return [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.newTransaction.toRoute);
              },
              icon: const Icon(Icons.edit))
        ];
      },
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      builder: (cubit, state) {
        return SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cubit.selectedTransaction.titleOfTransaction),
              Text(
                "${cubit.selectedTransaction.amountOfTransaction}€",
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
      onPop: (cubit) {
        cubit.cleanSelectedTransaction();
      },
    );
  }
}
