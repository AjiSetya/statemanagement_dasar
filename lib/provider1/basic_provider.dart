import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_color.dart';

class ContentProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "Provider State Management",
              style: TextStyle(color: applicationColor.color),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                    color: applicationColor.color,
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    duration: Duration(milliseconds: 500)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("AB"),
                  Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                          value: applicationColor.isColorBlue,
                          onChanged: (newvalue) {
                            applicationColor.isColorBlue = newvalue;
                          })),
                  Text("LB")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
