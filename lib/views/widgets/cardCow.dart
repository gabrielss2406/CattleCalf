// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fetin/views/screens/mains/InsightsCow.dart';
import 'package:flutter/material.dart';

import '../../models/CattleModel.dart';

class CardOne extends StatefulWidget {
  final Cattle cattle; // Adicione essa propriedade

  const CardOne({Key? key, required this.cattle}) : super(key: key);

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  void navigateToNewPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              InsightsCow()), // Substitua NewPage pela página de destino
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: navigateToNewPage,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 120, 144, 72),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage('assets/cow.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 0,
                                        bottom: 10),
                                    child: text(
                                        Colors.brown[800],
                                        Color.fromARGB(255, 192, 216, 96),
                                        widget.cattle.breed)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 0, bottom: 10),
                                    child: text(
                                        Colors.brown[800],
                                        Color.fromARGB(255, 192, 216, 96),
                                        widget.cattle.birthDate)),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: iconId(widget.cattle.idCattle.toString())),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget text(color1, color2, text) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color1,
            color1,
            color2,
            color2,
          ],
          stops: [0.0, 0.20, 0.20, 1.0],
        ),
      ),
      padding: EdgeInsets.only(top: 9, bottom: 5, left: 15, right: 5),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.brown[600],
          fontSize: 12,
          fontWeight: FontWeight.bold, // Alinha o texto ao centro
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget iconId(String text) {
    return Stack(
      children: [
        Image.asset(
          'assets/brinco.png',
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
