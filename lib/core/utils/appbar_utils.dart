import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/utils/app_navigation_utils.dart';

class AppbarUtils extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Widget? leading;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final PreferredSizeWidget? bottom;
  const AppbarUtils({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.height,
    this.leading,
    this.bottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 60,
      title: title ?? const Text(''),
      titleSpacing: 0,
      leadingWidth: leading != null ? 60 : null,
      actions: [action ?? Container()],
      leading:
          leading ??
          (hideBack
              ? null
              : InkWell(
                  onTap: () {
                    AppNavigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 23,
                    color: AppColors.primary,
                  ),
                )),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
