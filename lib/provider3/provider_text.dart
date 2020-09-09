import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstatemanagement/provider3/text_change.dart';

class ProviderTextChange extends StatelessWidget {
  static const id = 'providertext_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Text Changed'),
        centerTitle: true,
      ),
      body: BodyPage(),
    );
  }
}

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.watch<TextChange>().dataText,
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (newText){
              context.read<TextChange>().changeText(newText);
            },
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Masukkan teks',
            ),
          )
        ],
      ),
    );
  }
}
