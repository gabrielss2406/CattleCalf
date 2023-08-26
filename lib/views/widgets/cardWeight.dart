// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class CardThree extends StatefulWidget {
  const CardThree({Key? key});

  @override
  State<CardThree> createState() => _CardThreeState();
}

class _CardThreeState extends State<CardThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 192, 216, 96),
            Color.fromARGB(255, 192, 216, 96),
            const Color.fromARGB(255, 68, 49, 42),
            const Color.fromARGB(255, 68, 49, 42),
          ],
          stops: [0.0, 0.54, 0.54, 1.0],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '20:23 - 03/06/2023 '.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              color: Colors.brown[800],
            ),
          ),
          Text(
            '250,00 KG'.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Icon(Icons.scale, color: Colors.white),
        ],
      ),
    );
  }
}
