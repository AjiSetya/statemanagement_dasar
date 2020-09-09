import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/bloc1/basic_bloc.dart';
import 'package:providerstatemanagement/bloc2/bloc2.dart';
import 'package:providerstatemanagement/provider1/application_color.dart';
import 'package:providerstatemanagement/provider3/provider_text.dart';
import 'package:providerstatemanagement/provider3/text_change.dart';

import 'bloc1/basic_bloc.dart';
import 'bloc2/bloc2.dart';
import 'home_body.dart';
import 'provider1/basic_provider.dart';
import 'provider2/balance.dart';
import 'provider2/cart.dart';
import 'provider2/multi_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApplicationColor()),
        ChangeNotifierProvider(create: (_) => TextChange()),
        ChangeNotifierProvider<Balance>(create: (context) => Balance()),
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeBody.id,
      routes: {
        HomeBody.id: (context) => HomeBody(),
        ProviderBasic.id: (context) => ProviderBasic(),
        MultiContentProvider.id: (context) => MultiContentProvider(),
        BasicBloc.id: (context) => BasicBloc(),
        BlocKedua.id: (context) => BlocKedua(),
        ProviderTextChange.id: (context) => ProviderTextChange()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
