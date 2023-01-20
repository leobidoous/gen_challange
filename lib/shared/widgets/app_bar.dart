import 'package:flutter/material.dart'
    show
        AppBar,
        Border,
        BorderSide,
        BoxDecoration,
        BuildContext,
        DecoratedBox,
        EdgeInsets,
        Icon,
        Icons,
        InkWell,
        Key,
        Navigator,
        Padding,
        PreferredSizeWidget,
        Row,
        Size,
        StatelessWidget,
        Theme,
        VoidCallback,
        Widget;

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final double leadingWidth;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final VoidCallback? onTapTittle;

  const DefaultAppBar({
    Key? key,
    this.title,
    this.leading,
    this.onTapTittle,
    this.automaticallyImplyLeading = false,
    this.leadingWidth = 64,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTapTittle,
        child: AppBar(
          primary: true,
          title: title,
          leading: automaticallyImplyLeading
              ? InkWell(
                  onTap: Navigator.of(context).pop,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                      color: colorScheme.onBackground,
                    ),
                  ),
                )
              : leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          surfaceTintColor: colorScheme.secondary,
          backgroundColor: colorScheme.secondary,
          leadingWidth: leadingWidth,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: actions),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
