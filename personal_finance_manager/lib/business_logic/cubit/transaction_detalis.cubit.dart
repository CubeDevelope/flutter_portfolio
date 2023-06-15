import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/business_logic/cubit/base.cubit.dart';
import 'package:personal_finance_manager/models/transaction.model.dart';

class TransactionDetailsCubit extends BaseCubit {
  Transaction get selectedTransaction => appProvider.selectedTransaction!;


  cleanSelectedTransaction() {
    appProvider.cleanSelectedTransaction();
  }
}