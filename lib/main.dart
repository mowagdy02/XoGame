import 'package:flutter/material.dart';
import 'package:xogame/mainscreen.dart';
import 'package:xogame/playscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.main,
      routes: {
        AppRoutes.main: (context) =>  MainScreen(),
        AppRoutes.play: (context) =>  PlayScreen(),
      },
    );
  }
}

class AppRoutes {
  static const String main = '/';
  static const String play = '/play';
}
