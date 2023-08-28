// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fetin/database/services/TypeServices.dart';
import 'package:fetin/models/ExpenseModel.dart';
import 'package:fetin/models/TypeModel.dart';
import 'package:flutter/material.dart';

class CardTwo extends StatefulWidget {
  final Expense expense; // Adicione essa propriedade

  const CardTwo({Key? key, required this.expense}) : super(key: key);

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  Type? type;
  
  @override
  initState() {
    super.initState();

    TypeServices.getTypeById(widget.expense.type_idType).then((value) {
      print(value[0]);
      type = value[0];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(40), // Define as bordas arredondadas
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
                  color: Color.fromARGB(255, 192, 216, 96),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 0, bottom: 10),
                                child: text(
                                    Colors.brown[800],
                                    Color.fromARGB(255, 120, 144, 72),
                                    type?.name ?? '')),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 0, bottom: 10),
                                child: text(
                                    Colors.brown[800],
                                    Color.fromARGB(255, 120, 144, 72),
                                    widget.expense.date)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.purple,
                      ),
                      margin: EdgeInsets.only(left: 10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "RS ${widget.expense.amount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold, // Alinha o texto ao centro
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
