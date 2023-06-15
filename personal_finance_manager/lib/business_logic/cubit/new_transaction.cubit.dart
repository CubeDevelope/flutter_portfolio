import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/business_logic/cubit/base.cubit.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';

class NewTransactionCubit extends BaseCubit {

  Transaction get transaction => state as Transaction;

  @override
  setCubitState(AppProvider provider) {
    Transaction transaction = appProvider.selectedTransaction ?? Transaction();
    emit(transaction);
  }

  addTransaction() {
    appProvider.addTransaction(transaction);
  }
}
