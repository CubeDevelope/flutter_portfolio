import 'dart:math';

import 'package:personal_finance_manager/models/base_db.model.dart';
import 'package:personal_finance_manager/models/category.model.dart';

class Transaction extends BaseDBModel {
  static const String titleOfTransactionJSONKey = "titleOfTransaction";
  static const String dateOfTransactionJSONKey = "dateOfTransaction";
  static const String amountOfTransactionJSONKey = "amountOfTransaction";
  static const String descriptionOfTransactionJSONKey =
      "descriptionOfTransaction";

  String titleOfTransaction;
  DateTime? dateOfTransaction;
  double amountOfTransaction;
  String? descriptionOfTransaction;
  List<Category>? categories;

  Transaction({
    this.titleOfTransaction = "",
    this.dateOfTransaction,
    this.amountOfTransaction = 0,
    this.descriptionOfTransaction,
    String uuid = "",
  }) : super(uuid) {
    categories = [];
  }

  clone(Transaction transaction) {
    titleOfTransaction = transaction.titleOfTransaction;
    amountOfTransaction = transaction.amountOfTransaction;
    dateOfTransaction = transaction.dateOfTransaction;
    descriptionOfTransaction = transaction.descriptionOfTransaction;
    categories = transaction.categories;
  }

  @override
  BaseDBModel fromJson(Map json) {
    return Transaction(
      uuid: json[BaseDBModel.uuidJSONKey],
      titleOfTransaction: json[titleOfTransactionJSONKey],
      amountOfTransaction: json[amountOfTransactionJSONKey],
      dateOfTransaction: baseDateFormat.parse(
        json[dateOfTransactionJSONKey],
      ),
      descriptionOfTransaction: json[descriptionOfTransactionJSONKey],
    );
  }
}
