import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isColorBlue = true;

  bool get isColorBlue => _isColorBlue;

  set isColorBlue(bool value) {
    _isColorBlue = value;
    notifyListeners();
  }

  Color get color => (_isColorBlue) ? Colors.lightBlue : Colors.amber;
}
