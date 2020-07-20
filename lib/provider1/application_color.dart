import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  // data state
  bool _isColorBlue = true;

  // getter state
  bool get isColorBlue => _isColorBlue;

  // setter state
  set isColorBlue(bool value) {
    _isColorBlue = value;
    // memberitahu consumer bahwa ada perubahan data
    notifyListeners();
  }

  // getter data warna
  Color get color => (_isColorBlue) ? Colors.lightBlue : Colors.amber;
}
