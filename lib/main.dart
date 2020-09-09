import 'package:flutter/material.dart';
import 'package:providerstatemanagement/bloc1/basic_bloc.dart';
import 'package:providerstatemanagement/bloc2/bloc2.dart';

import 'bloc1/basic_bloc.dart';
import 'bloc2/bloc2.dart';
import 'home_body.dart';
import 'provider1/basic_provider.dart';
import 'provider2/multi_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeBody.id,
      routes: {
        HomeBody.id: (context) => HomeBody(),
        Provider.id: (context) => Provider(),
        MultiContentProvider.id: (context) => MultiContentProvider(),
        BasicBloc.id: (context) => BasicBloc(),
        BlocKedua.id: (context) => BlocKedua()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
