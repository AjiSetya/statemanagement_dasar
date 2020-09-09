import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:providerstatemanagement/bloc1/color_bloc.dart';

class BasicBloc extends StatefulWidget {
  static const String id = 'bloc_screen';

  @override
  _BasicBlocState createState() => _BasicBlocState();
}

class _BasicBlocState extends State<BasicBloc> {
  // buat objek dari class colorbloc
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    // tutup proses bloc
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic BLoC'),
      ),
      body: Center(
        // menampilkan stream dengan streambuilder
        child: StreamBuilder(
          // asal stream yang diterima
          stream: colorBloc.stateStream,
          // data default
          initialData: Colors.amber,
          // widget yang ingin ditampilkan
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 100,
              width: 100,
              // datanya diambil dari snapshot
              color: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.amber,
            onPressed: () {
              // memasukkan data ke dalam eventsink
              colorBloc.eventSink.add(ColorEvent.to_amber);
            },
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              // memasukkan data ke dalam eventsink
              colorBloc.eventSink.add(ColorEvent.to_blue);
            },
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
