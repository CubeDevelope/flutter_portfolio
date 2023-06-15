import 'package:flutter/material.dart';

class NewCategoryButton extends StatelessWidget {
  final Function()? onPressed;
  final EdgeInsets padding;

  const NewCategoryButton({
    super.key,
    this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: Theme.of(context).buttonBarTheme.buttonHeight,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.grey)),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
