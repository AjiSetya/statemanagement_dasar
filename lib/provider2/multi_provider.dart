import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider2/balance.dart';
import 'package:providerstatemanagement/provider2/cart.dart';

class MultiContentProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Balance>(create: (context) => Balance()),
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Provider State Management",
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
                  Consumer<Balance>(
                    builder: (context, balance, _) => Text(
                      balance.money.toString(),
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              child: Consumer<Cart>(
                builder: (context, cart, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Apple x ' + cart.quantity.toString()),
                    Text((5000 * cart.quantity).toString())
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Consumer<Balance>(
          builder: (context, balance, _) => Consumer<Cart>(
            builder: (context, cart, _) => FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: () {
                if (balance.money >= 5000) {
                  cart.quantity++;
                  balance.money -= 5000;
                }
              },
              child: Icon(Icons.add_shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
