import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/models/base_db.model.dart';

abstract class BaseCubit extends Cubit<BaseDBModel?> {
  late AppProvider appProvider;

  setProvider(AppProvider appProvider) {
    this.appProvider = appProvider;
    setCubitState(appProvider);
  }

  setCubitState(AppProvider provider) {}

  BaseCubit({BaseDBModel? model}) : super(model);
}
