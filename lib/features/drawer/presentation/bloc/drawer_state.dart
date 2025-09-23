abstract class DrawerState {}

class DrawerChanges extends DrawerState {
  final String currentLang;

  DrawerChanges({required this.currentLang});
}
