import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/business_logic/cubit/base.cubit.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';

class HomeCubit extends BaseCubit {
  HomeCubit();

  List<Transaction> get transactions => appProvider.transactions;

  int get transactionsLength => transactions.length;

  selectTransaction(int index) {
    appProvider.selectTransaction(index);
  }

}
