library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

final advancedDrawerController = AdvancedDrawerController();

void handleMenuButtonPressed() {
  advancedDrawerController.showDrawer();
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
