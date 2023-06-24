import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc/cardbloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CardBloc(),
    child: const MyApp(),
  ));
}
