import 'package:flutter/material.dart' hide Router;
import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/views/home.page.dart';
import 'package:provider/provider.dart';

import 'utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        onGenerateRoute: Router.routing,
        initialRoute: Routes.home.toRoute,
        home: const SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
