import 'package:flutter/material.dart';

class TextChange with ChangeNotifier{
  String _dataText = 'Hello World !';

  String get dataText => _dataText;

  void changeText(String newText){
    _dataText = newText;
    notifyListeners();
  }
}