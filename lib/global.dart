library my_prj.globals;

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

final advancedDrawerController = AdvancedDrawerController();

void handleMenuButtonPressed() {
  advancedDrawerController.showDrawer();
}
