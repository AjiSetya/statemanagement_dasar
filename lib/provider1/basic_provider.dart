import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_color.dart';

class ProviderBasic extends StatelessWidget {
  static const String id = 'provider_screen';

  @override
  Widget build(BuildContext context) {
    // menggunakan pemberitahuan perubahan data dengan applicationcolor
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          // widget yang akan menampilkan data dibungkus dengan consumer
          title: Text(
            "Provider Basic",
            // data warna diambil dari applicationcolor mengikuti state yang terbaru
            style: TextStyle(color: context.watch<ApplicationColor>().color),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              // data warna diambil dari applicationcolor mengikuti state yang terbaru
                color: context.watch<ApplicationColor>().color,
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                duration: Duration(milliseconds: 500)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("AB"),
                Switch(
                  // data switch diambil dari applicationcolor mengikuti state yang terbaru
                    value: context.watch<ApplicationColor>().isColorBlue,
                    onChanged: (newvalue) {
                      // mengubah state berdasarkan nilai switch terbaru
                      context.read<ApplicationColor>().isColorBlue = newvalue;
                    }),
                Text("LB")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
