import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider2/balance.dart';
import 'package:providerstatemanagement/provider2/cart.dart';

class MultiContentProvider extends StatelessWidget {
  static const String id = 'multiprovider_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Multi Provider",
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Balance'),
                Text(
                  // mengambil teks dari getter money
                  context.watch<Balance>().money.toString(),
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // mengambil teks dari getter quantity
                Text('Apple x ' + context.watch<Cart>().quantity.toString()),
                Text((5000 * context.watch<Cart>().quantity).toString())
              ],
            ),
          ),
        ],
      ),
      // karena mengambil dari 2 provider maka dibuat nested builder
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          if (context.read<Balance>().money >= 5000) {
            // set quantity
            context.read<Cart>().quantity++;
            // set money
            context.read<Balance>().money -= 5000;
          }
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
