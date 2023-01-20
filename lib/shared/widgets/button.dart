import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        EdgeInsets,
        Key,
        BuildContext,
        Opacity,
        AbsorbPointer,
        ElevatedButton,
        ButtonStyle,
        MaterialStateProperty,
        MaterialTapTargetSize,
        SafeArea,
        RoundedRectangleBorder,
        BorderRadius,
        BorderSide,
        SizedBox,
        CircularProgressIndicator,
        Theme,
        Color,
        ColorScheme;

enum ButtonType { primary, secondary, background }

class Button extends StatelessWidget {
  final ButtonType type;
  final Function()? onPressed;
  final Widget text;
  final bool isEnabled;
  final bool isLoading;
  final bool isSafe;
  final EdgeInsets padding;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
    this.isSafe = false,
    this.type = ButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = (Theme.of(context)).colorScheme;

    return Opacity(
      opacity: isLoading || !isEnabled ? 0.5 : 1,
      child: AbsorbPointer(
        absorbing: isLoading || !isEnabled,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              _backgroundColor(colorScheme),
            ),
            surfaceTintColor: MaterialStateProperty.all(
              _backgroundColor(colorScheme),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: _borderColor(colorScheme),
                width: 2,
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: MaterialStateProperty.all(5),
            padding: MaterialStateProperty.all(padding),
          ),
          child: SafeArea(
            bottom: isSafe,
            top: false,
            child: isLoading
                ? SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(
                      color: colorScheme.secondary,
                      strokeWidth: 2,
                    ),
                  )
                : text,
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(ColorScheme colorScheme) {
    switch (type) {
      case ButtonType.primary:
        return colorScheme.primary;
      case ButtonType.secondary:
        return colorScheme.secondary;
      case ButtonType.background:
        return colorScheme.surface;
    }
  }

  Color _borderColor(ColorScheme colorScheme) {
    switch (type) {
      case ButtonType.primary:
        return colorScheme.primary;
      case ButtonType.secondary:
        return colorScheme.secondary;
      case ButtonType.background:
        return colorScheme.secondary;
    }
  }
}
