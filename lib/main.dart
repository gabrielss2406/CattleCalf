import 'package:fetin/views/screens/mains/EconomyPage.dart';
import 'package:fetin/views/screens/SplashScreen.dart';
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:fetin/views/screens/mains/FilterPage.dart';
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
        //'/insights': (context) => InsightsCow(),
      },
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}
