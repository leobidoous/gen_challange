import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Key,
        Widget,
        BuildContext,
        SingleChildScrollView,
        BouncingScrollPhysics,
        Column,
        CrossAxisAlignment,
        MainAxisAlignment,
        MainAxisSize,
        Icon,
        Icons,
        RichText,
        TextAlign,
        TextSpan,
        Theme,
        EdgeInsets,
        FontWeight,
        Text,
        Padding;

import '../button.dart';

class SearchResponseEmpty extends StatelessWidget {
  const SearchResponseEmpty({
    Key? key,
    required this.message,
    this.onPressed,
    this.btnLabel = 'Buscar novamente',
  }) : super(key: key);

  final String message;
  final String btnLabel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = (Theme.of(context)).textTheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, size: 60),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Nenhum resultado encontrado para o termo:\n',
              style: textTheme.headline6?.copyWith(),
              children: [
                TextSpan(
                  text: message,
                  style: textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Button(
                text: Text(
                  btnLabel,
                  style: textTheme.bodyText1,
                ),
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );
  }
}
