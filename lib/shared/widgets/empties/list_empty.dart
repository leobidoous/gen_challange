import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Key,
        Widget,
        BuildContext,
        SingleChildScrollView,
        BouncingScrollPhysics,
        EdgeInsets,
        Column,
        CrossAxisAlignment,
        MainAxisAlignment,
        MainAxisSize,
        Icon,
        Icons,
        Theme,
        SizedBox,
        Text,
        TextAlign,
        Padding;

import '../button.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    Key? key,
    required this.message,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.btnLabel = 'Buscar novamente',
  }) : super(key: key);
  final EdgeInsets padding;
  final String message;
  final String btnLabel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = (Theme.of(context)).textTheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: textTheme.bodyText1?.color,
            size: 60,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: textTheme.bodyText1,
          ),
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Button(
                text: Text(
                  btnLabel,
                  style: textTheme.bodyText2,
                ),
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );
  }
}
