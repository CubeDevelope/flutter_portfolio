import 'package:flutter/material.dart';
import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:provider/provider.dart';

class ScaffoldProvider extends StatelessWidget {
  const ScaffoldProvider({
    super.key,
    required this.builder,
    this.child,
    this.title = "",
    this.actions,
    this.floatingActionButton,
  });

  final Widget Function(
    BuildContext context,
    AppProvider appProvider,
    Widget? child,
  ) builder;
  final Widget Function()? child;
  final String title;
  final FloatingActionButton? floatingActionButton;
  final List<Widget> Function(AppProvider)? actions;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return Scaffold(
          floatingActionButton: floatingActionButton,
          appBar: AppBar(
            title: Text(title),
            actions: actions?.call(value),
          ),
          body: builder.call(context, value, child),
        );
      },
      child: child?.call(),
    );
  }
}
