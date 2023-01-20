import 'package:flutter/material.dart'
    show
        BouncingScrollPhysics,
        BuildContext,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Key,
        MainAxisAlignment,
        MainAxisSize,
        Padding,
        SelectableText,
        SingleChildScrollView,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        Widget;

import 'button.dart';

class RequestError extends StatelessWidget {
  final String message;
  final String btnLabel;
  final double? maxHeight;
  final EdgeInsets padding;
  final Function()? onPressed;

  const RequestError({
    Key? key,
    required this.message,
    this.onPressed,
    this.maxHeight,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.btnLabel = 'Tentar novamente',
  }) : super(key: key);

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
          SizedBox(
            height: maxHeight,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SelectableText(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodyText1,
              ),
            ),
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
