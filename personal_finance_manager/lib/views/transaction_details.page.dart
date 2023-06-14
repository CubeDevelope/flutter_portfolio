import 'package:flutter/material.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';
import 'package:personal_finance_manager/utils/router.dart';
import 'package:personal_finance_manager/views/components/scaffold_provider.dart';

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage({super.key});

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldProvider(
      actions: (p0) {
        return [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.newTransaction.toRoute);
              },
              icon: Icon(Icons.edit))
        ];
      },
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      builder: (context, appProvider, child) {
        Transaction selectedTransaction = appProvider.selectedTransaction!;
        return SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedTransaction.titleOfTransaction),
              Text(
                "${selectedTransaction.amountOfTransaction}€",
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
      onPop: (appProvider) {
        appProvider.selectTransaction(-1);
      },
    );
  }
}
