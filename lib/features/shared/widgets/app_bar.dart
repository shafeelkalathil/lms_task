import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.bottomWidget,
    this.backgroundColor,
    this.trailing,
  });
  final String title;
  final PreferredSizeWidget? bottomWidget;
  final Color? backgroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final hasDrawer = Scaffold.of(context).hasDrawer;
    final canPop = Navigator.of(context).canPop();
    return AppBar(
      title: Text(
        title,
        style: heading1.copyWith(color: silverChalice.shade900),
      ),
      actions: [trailing ?? const SizedBox.shrink()],
      surfaceTintColor: Colors.transparent,
      shadowColor:
          bottomWidget != null ? silverChalice.shade100.withOpacity(0.5) : null,
      elevation: bottomWidget != null ? 1 : null,
      backgroundColor: backgroundColor,
      titleSpacing:
          canPop ? context.screenWidth * 0.02 : context.screenWidth * 0.06,
      leading: leadingIcon(context, hasDrawer: hasDrawer, canPop: canPop),
      bottom: bottomWidget,
    );
  }

  Widget? leadingIcon(
    BuildContext context, {
    required bool hasDrawer,
    required bool canPop,
  }) {
    if (canPop) {
      return Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.03,
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(Assets.icons.backArrow, width: 24),
        ),
      );
    }
    if (hasDrawer) {
      return Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.03,
        ),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: silverChalice.shade100,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? 100 : kToolbarHeight);
}
