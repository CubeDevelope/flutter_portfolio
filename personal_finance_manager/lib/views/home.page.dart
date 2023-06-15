import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:personal_finance_manager/business_logic/cubit/home.cubit.dart';
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
    return AppScaffold<HomeCubit>(
      builder: (cubit, state) {
        return Column(
          children: [
            //Qui saranno inseriti i text che mostreranno l'ammontare economico dell'utente
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: Row(
                children: [
                  //Questo mostrerà la variazione economica
                  const Text(""),

                  //Questo text contiene il budget dell'utente
                  Expanded(
                    child: Text(
                      "${_getTransactionSum(cubit.transactions)}€",
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
                      cubit.selectTransaction(index);
                      Navigator.pushNamed(context, Routes.details.toRoute);
                    },
                    trailing: Text("${cubit.transactions.elementAt(index).amountOfTransaction}€"),
                    title: Text(
                        cubit.transactions[index].titleOfTransaction),
                  );
                },
                itemCount: cubit.transactionsLength,
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
      ), cubit: HomeCubit(),
    );
  }
}
