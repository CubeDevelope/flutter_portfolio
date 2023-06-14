import 'package:flutter/material.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';

class AppProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }
}
