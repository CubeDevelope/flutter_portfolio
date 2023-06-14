import 'package:flutter/material.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';

class AppProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  Transaction? _selectedTransaction;

  Transaction? get selectedTransaction => _selectedTransaction;

  List<Transaction> get transactions => _transactions;

  addTransaction(Transaction transaction) {
    int position = _transactions.indexOf(transaction);
    if (position < 0) {
      _transactions.add(transaction);
    } else {
      _transactions.elementAt(position).clone(transaction);
    }
    notifyListeners();
  }

  removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }

  cleanSelectedTransaction() {
    _selectedTransaction = null;
  }

  selectTransaction(int index) {
    if (index < 0) {
      _selectedTransaction = null;
    } else {
      _selectedTransaction = _transactions.elementAt(index);
    }
  }
}
