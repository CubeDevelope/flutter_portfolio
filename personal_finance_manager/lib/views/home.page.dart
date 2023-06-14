import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';
import 'package:personal_finance_manager/utils/router.dart';
import 'package:personal_finance_manager/views/components/scaffold_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _getTransactionSum(List<Transaction> transactions) {
    double value = 0;
    for (var element in transactions) {
      value += element.amountOfTransaction;
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldProvider(
      builder: (p0, appProvider, p2) {
        return Column(
          children: [
            //Qui saranno inseriti i text che mostreranno l'ammontare economico dell'utente
            Container(
              height: MediaQuery.of(context).size.height * .15,
              child: Row(
                children: [
                  //Questo mostrerà la variazione economica
                  const Text(""),

                  //Questo text contiene il budget dell'utente
                  Expanded(
                    child: Text(
                      "${_getTransactionSum(appProvider.transactions)}€",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            //Qui verrà visuazizzata la lista delle transazioni
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      appProvider.selectTransaction(index);
                      Navigator.pushNamed(context, Routes.details.toRoute);
                    },
                    title: Text(
                        appProvider.transactions[index].titleOfTransaction),
                  );
                },
                itemCount: appProvider.transactions.length,
              ),
            )
          ],
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.newTransaction.toRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
