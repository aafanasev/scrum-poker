import 'package:flutter/foundation.dart';

class ThemeModel extends ChangeNotifier {
  bool _darkMode = true;

  bool get isDarkMode => _darkMode;

  void toggleDarkMode() {
    _darkMode = !_darkMode;

    notifyListeners();
  }
}
