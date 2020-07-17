import 'package:flutter/material.dart';

class Balance with ChangeNotifier {
  int _money = 100000;

  int get money => _money;

  set money(int value) {
    _money = value;
    notifyListeners();
  }
}
