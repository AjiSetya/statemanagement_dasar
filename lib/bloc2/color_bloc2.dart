import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { to_red, to_orange }

class ColorBloc2 extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  ColorBloc2(Color initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_red) ? Colors.red : Colors.orange;
    yield _color;
  }
}
