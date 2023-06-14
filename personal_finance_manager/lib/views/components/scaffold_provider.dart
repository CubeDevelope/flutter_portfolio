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
    this.onPop,
    this.padding = EdgeInsets.zero,
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
  final Function(AppProvider appProvider)? onPop;
  final EdgeInsets padding;

  _buildOnPopStructured(Widget child, AppProvider appProvider) {
    if (onPop != null) {
      return WillPopScope(
        child: child,
        onWillPop: () {
          onPop!.call(appProvider);
          return Future.value(true);
        },
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return _buildOnPopStructured(
          Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            bottomNavigationBar: BottomAppBar(
              height: AppBar().preferredSize.height,
              child: Row(
                children: [
                  if (Navigator.canPop(context))
                    IconButton(
                      onPressed: () {
                        value.cleanSelectedTransaction();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  Expanded(
                    child: Text(title),
                  ),
                  ...actions?.call(value) ?? [],
                ],
              ),
            ),
            body: Padding(
              padding: padding,
              child: builder.call(context, value, child),
            ),
          ),
          value,
        );
      },
      child: child?.call(),
    );
  }
}
