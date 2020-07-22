import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providerstatemanagement/bloc2/color_bloc2.dart';

class BlocKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc2 bloc2 = BlocProvider.of(context);

    return BlocProvider(
      create: (context) => ColorBloc2(Colors.red),
      child: Scaffold(
        appBar: AppBar(
          title: Text("BLoC With Package"),
        ),
        body: Center(
          child: BlocBuilder<ColorBloc2, Color>(
            builder: (context, currentColor) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 100,
              width: 100,
              color: currentColor,
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                bloc2.add(ColorEvent.to_red);
              },
              backgroundColor: Colors.red,
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                bloc2.add(ColorEvent.to_orange);
              },
              backgroundColor: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
