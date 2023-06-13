class Transaction {
  String titleOfTransaction;
  DateTime? dateOfTransaction;
  double amountOfTransaction;
  String? descriptionOfTransaction;

  Transaction({
    this.titleOfTransaction = "",
    this.dateOfTransaction,
    this.amountOfTransaction = 0,
    this.descriptionOfTransaction,
  });
}
