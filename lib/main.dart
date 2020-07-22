import 'package:flutter/material.dart';
import 'package:providerstatemanagement/bloc1/basic_bloc.dart';
import 'package:providerstatemanagement/bloc2/bloc2.dart';

import 'provider1/basic_provider.dart';
import 'provider2/multi_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeBody(),
        '/contentprovider': (context) => ContentProvider(),
        '/multiprovider': (context) => MultiContentProvider(),
        '/basicbloc': (context) => BasicBloc(),
        '/bloc2': (context) => BlocKedua()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Provider State Management",
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text('Content Provider'),
                onPressed: () {
                  Navigator.pushNamed(context, '/contentprovider');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text('Multi Content Provider'),
                onPressed: () {
                  Navigator.pushNamed(context, '/multiprovider');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text('BLoC'),
                onPressed: () {
                  Navigator.pushNamed(context, '/basicbloc');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text('BLoC Kedua'),
                onPressed: () {
                  Navigator.pushNamed(context, '/bloc2');
                }),
          ),
        ],
      ),
    );
  }
}
