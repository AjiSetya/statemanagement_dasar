import 'dart:async';

import 'package:flutter/material.dart';

// pilihan kondisi state
enum ColorEvent { to_amber, to_blue }

class ColorBloc {
  // variable data warna
  Color _color = Colors.amber;

  // tempat pemrosesan data dari sink ke stream event
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  // sink dari eventcontroller, untuk menerima event dari UI
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  // tempat pemrosesan data dari sink ke stream state
  StreamController<Color> _stateController = StreamController<Color>();
  // sink dari statecontroller untuk menerima state dari perubahan
  StreamSink<Color> get _stateSink => _stateController.sink;
  // stream dari statecontroller, untuk memberikan data state terbaru ke UI
  Stream<Color> get stateStream => _stateController.stream;

  // method yang akan menerima stream dari eventcontroller dan menentukan state
  void _mapEventToState(ColorEvent colorEvent) {
    // data color mengikuti data event yang masuk dari eventsink
    _color = (colorEvent == ColorEvent.to_amber) ? Colors.amber : Colors.blue;

    // memasukkan data state ke sink statecontroller
    _stateSink.add(_color);
  }

  // memasukkan stream dari eventcontroller ke method mapEventToState
  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  // menutup proses
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

// controller = untuk mengatur data yang masuk, diproses, dan dikeluarkan
// sink = untuk memasukkan data event / state
// stream = data yang dihasilkan dan terus menerus mengalir
