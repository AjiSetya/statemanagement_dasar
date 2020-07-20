import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_color.dart';

class ContentProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // menggunakan pemberitahuan perubahan data dengan applicationcolor
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // widget yang akan menampilkan data dibungkus dengan consumer
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "Provider Basic",
              // data warna diambil dari applicationcolor mengikuti state yang terbaru
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
                    // data warna diambil dari applicationcolor mengikuti state yang terbaru
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
                          // data switch diambil dari applicationcolor mengikuti state yang terbaru
                          value: applicationColor.isColorBlue,
                          onChanged: (newvalue) {
                            // mengubah state berdasarkan nilai switch terbaru
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
