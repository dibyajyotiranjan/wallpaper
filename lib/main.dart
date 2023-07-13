import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper/screen/home_screen.dart';
import 'package:wall_paper/walpaper_block/walpaper_bloc.dart';
void main() {
  runApp(
      BlocProvider<WalpaperBloc>(
  create: (context) => WalpaperBloc(),
  child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}



