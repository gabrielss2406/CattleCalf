// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/models/AnnotationModel.dart';
import 'package:fetin/views/screens/pop_ups/AnnotationDetails.dart';
import 'package:flutter/material.dart';

class CardFour extends StatefulWidget {
  final Annotation annotation; // Adicione essa propriedade

  const CardFour({Key? key, required this.annotation}) : super(key: key);

  @override
  State<CardFour> createState() => _CardFourState();
}

class _CardFourState extends State<CardFour> {
  void _openWidget(BuildContext context, int option) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(125, 0, 0, 0),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnnotationDetails(annotation: widget.annotation,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 5, right: 5, left: 5),
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
          stops: [0.0, 0.8, 0.8, 1.0],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0), // Adicione um espaçamento à esquerda
            child: Text(
              widget.annotation.reminder.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[800],
              ),
            ),
          ),
          Ink(
            child: IconButton(
              icon: Icon(Icons.edit_note),
              color: Colors.white,
              onPressed: () => _openWidget(context, 1),
            ),
          )
        ],
      ),
    );
  }
}
