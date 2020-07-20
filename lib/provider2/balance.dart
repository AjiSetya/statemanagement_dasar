import 'package:flutter/material.dart';

class Balance with ChangeNotifier {
  // data uang
  int _money = 100000;

  // getter
  int get money => _money;

  // setter
  set money(int value) {
    _money = value;
    // pemberitahu pembaruan data
    notifyListeners();
  }
}
