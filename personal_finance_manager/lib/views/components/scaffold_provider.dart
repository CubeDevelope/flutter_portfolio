import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_manager/business_logic/app_provider.dart';
import 'package:personal_finance_manager/business_logic/cubit/base.cubit.dart';
import 'package:personal_finance_manager/models/base_db.model.dart';
import 'package:provider/provider.dart';

class AppScaffold<T extends BaseCubit> extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.builder,
    this.title = "",
    this.actions,
    this.floatingActionButton,
    this.onPop,
    this.padding = EdgeInsets.zero,
    required this.cubit,
  });

  final Widget Function(T cubit, BaseDBModel? state) builder;

  final String title;
  final FloatingActionButton? floatingActionButton;
  final List<Widget> Function(T cubit)? actions;
  final Function(T cubit)? onPop;
  final EdgeInsets padding;

  final BaseCubit cubit;

  _buildOnPopStructured(Widget child) {
    if (onPop != null) {
      return WillPopScope(
        child: child,
        onWillPop: () {
          onPop!.call(cubit as T);
          return Future.value(true);
        },
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    cubit.setProvider(context.read<AppProvider>());

    return BlocBuilder<T, BaseDBModel?>(
      builder: (context, state) {
        return _buildOnPopStructured(
          Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            bottomNavigationBar: BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: AppBar().preferredSize.height,
              child: Row(
                children: [
                  if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false)
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back)),
                  Expanded(
                    child: Text(title),
                  ),
                  ...actions?.call(cubit as T) ?? [],
                ],
              ),
            ),
            body: Padding(
              padding: padding,
              child: Consumer<AppProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return builder.call(cubit as T, state);
                },
              ),
            ),
          ),
        );
      },
      bloc: cubit as T,
    );
  }
}
