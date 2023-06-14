import 'package:flutter/material.dart';
import 'package:personal_finance_manager/views/home.page.dart';
import 'package:personal_finance_manager/views/new_transaction.page.dart';
import 'package:personal_finance_manager/views/profile.page.dart';
import 'package:personal_finance_manager/views/setting.page.dart';
import 'package:personal_finance_manager/views/transaction_details.page.dart';

enum Routes {
  home,
  settings,
  details,
  profile,
  newTransaction,
}

extension RouteExt on Routes {
  String get toRoute {
    if (this == Routes.home) {
      return '/';
    } else {
      return "/${toString().split('.').last}";
    }
  }

  static getRouteFromName(String name) {
    return Routes.values.firstWhere((element) => element.toRoute == name);
  }
}

class Router {
  static Route routing(RouteSettings settings) {
    Widget page = Container();

    switch (RouteExt.getRouteFromName(settings.name!)) {
      case Routes.home:
        page = const HomePage();
        break;
      case Routes.settings:
        page = const SettingsPage();
        break;
      case Routes.details:
        page = const TransactionDetailsPage();
        break;
      case Routes.profile:
        page = const ProfilePage();
        break;
      case Routes.newTransaction:
        page = const NewTransactionPage();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(child: page);
      },
    );
  }
}
