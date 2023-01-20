import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Key,
        Widget,
        BuildContext,
        Column,
        CrossAxisAlignment,
        MainAxisAlignment,
        ClipRRect,
        BorderRadius,
        LinearProgressIndicator,
        SizedBox,
        CircularProgressIndicator,
        Theme;

enum LoadingType { primary, linear }

class Loading extends StatelessWidget {
  final LoadingType type;
  final double? width;
  final double? height;
  const Loading({
    Key? key,
    this.type = LoadingType.primary,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: type == LoadingType.linear
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (type == LoadingType.linear)
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: const LinearProgressIndicator(minHeight: .5),
          ),
        if (type == LoadingType.primary)
          SizedBox(
            width: width,
            height: height,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: theme.colorScheme.primary,
              backgroundColor: theme.backgroundColor,
            ),
          ),
      ],
    );
  }
}
