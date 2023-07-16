import 'package:fetin/views/screens/EconomyPage.dart';
import 'package:fetin/views/screens/InsightsCow.dart';
import 'package:fetin/views/screens/SplashScreen.dart';
import 'package:fetin/views/screens/StartPage.dart';
import 'package:fetin/views/screens/FilterPage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CattleCalf",
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/start': (context) => StartPage(),
        '/economy': (context) => EconomyPage(),
        '/filter': (context) => FilterPage(),
        '/insights': (context) => InsightsCow(),
      },
    );
  }
}
