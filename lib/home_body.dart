import 'package:flutter/material.dart';

import 'bloc1/basic_bloc.dart';
import 'bloc2/bloc2.dart';
import 'item_button.dart';
import 'provider1/basic_provider.dart';
import 'provider2/multi_provider.dart';

class HomeBody extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "State Managements",
        ),
      ),
      body: ListView(
        children: <Widget>[
          ItemButton(
              buttonText: 'Provider',
              onPressed: () {
                Navigator.pushNamed(context, Provider.id);
              }),
          ItemButton(
              buttonText: 'Multi Provider',
              onPressed: () {
                Navigator.pushNamed(context, MultiContentProvider.id);
              }),
          ItemButton(
              buttonText: 'BLoC',
              onPressed: () {
                Navigator.pushNamed(context, BasicBloc.id);
              }),
          ItemButton(
              buttonText: 'BLoC Kedua',
              onPressed: () {
                Navigator.pushNamed(context, BlocKedua.id);
              })
        ],
      ),
    );
  }
}
