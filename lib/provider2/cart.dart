import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  // data quantity
  int _quantity = 0;

  // getter
  int get quantity => _quantity;

  // setter
  set quantity(int value) {
    _quantity = value;
    // pemberitahu pembaruan data
    notifyListeners();
  }
}
