import 'dart:math';

class Transaction {
  String uuid = "";
  String titleOfTransaction;
  DateTime? dateOfTransaction;
  double amountOfTransaction;
  String? descriptionOfTransaction;

  Transaction({
    this.titleOfTransaction = "",
    this.dateOfTransaction,
    this.amountOfTransaction = 0,
    this.descriptionOfTransaction,
  }) {
    String id = "";
    for (int i = 0; i < 10; i++) {
      id = Random().nextInt(10).toString();
    }
    uuid = id;
  }

  setAll({String? title, double? amount}) {
    if (title != null) titleOfTransaction = title;
    if (amount != null) amountOfTransaction = amount;
  }


  clone(Transaction transaction) {
    titleOfTransaction = transaction.titleOfTransaction;
    amountOfTransaction = transaction.amountOfTransaction;
    dateOfTransaction = transaction.dateOfTransaction;
    descriptionOfTransaction = transaction.descriptionOfTransaction;
  }


}
