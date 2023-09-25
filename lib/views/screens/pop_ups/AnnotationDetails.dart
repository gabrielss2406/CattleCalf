// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:cattecalf/models/AnnotationModel.dart';
import 'package:flutter/material.dart';

class AnnotationDetails extends StatefulWidget {
  final Annotation annotation; // Adicione essa propriedade

  const AnnotationDetails({
    Key? key,
    required this.annotation,
  }) : super(key: key);

  @override
  State<AnnotationDetails> createState() => _AnnotationDetailsState();
}

class _AnnotationDetailsState extends State<AnnotationDetails> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.brown[800],
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              'Detalhes da Anotação',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          backgroundColor: Color.fromARGB(255, 192, 216, 96),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textShow('Título', widget.annotation.reminder),
                textShow('Data', widget.annotation.date),
                textShow('Anotação', widget.annotation.annotation)
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      const Color.fromARGB(255, 190, 69, 42))),
            ),
          ],
        );
      },
    );
  }
}

Widget textShow(String title, String text) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Cor do título
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 120, 144, 72),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
