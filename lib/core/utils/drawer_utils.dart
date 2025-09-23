import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/features/drawer/presentation/drawer_page.dart';
import 'package:law_diary/global.dart';

class DrawerUtils extends StatelessWidget {
  final Widget child;
  const DrawerUtils({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: SizedBox(width: double.infinity, height: double.infinity),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(seconds: 1),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      backdropColor: AppColors.drawerBackground,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const DrawerPage(),
      child: child,
    );
  }
}
