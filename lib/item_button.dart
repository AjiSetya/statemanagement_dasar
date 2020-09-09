import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  ItemButton({this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text(buttonText),
        onPressed: onPressed,
      ),
    );
  }
}