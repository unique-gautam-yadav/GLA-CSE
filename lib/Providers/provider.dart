import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  bool _isDark = false;

  bool get curDark => _isDark;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
