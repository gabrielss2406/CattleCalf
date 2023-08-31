// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:fetin/database/services/AnnotationServices.dart';
import 'package:flutter/material.dart';

class NewAnnotation extends StatefulWidget {
  final int? idCattle; // Adicione essa propriedade

  const NewAnnotation({Key? key, required this.idCattle}) : super(key: key);

  @override
  State<NewAnnotation> createState() => _NewAnnotationState();
}

class _NewAnnotationState extends State<NewAnnotation> {
  final _titulo = TextEditingController();
  final _data = TextEditingController();
  final _anotacao = TextEditingController();

  Future<void> _sendNewAnnotation(String reminder, String annotation, String date) async {

    try {
      await AnnotationServices.createAnnotation(reminder, annotation, date, widget.idCattle);
    } catch (error) {
      print(error);
      // Tratamento de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao enviar o registro.'),
        backgroundColor: Colors.red,
      ));
    }

  }

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
              'Nova Anotação',
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
                textEntry(_titulo, 'titulo'),
                textEntry(_data, 'data'),
                textEntry(_anotacao, 'anotacao')
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _sendNewAnnotation(_titulo.text, _anotacao.text, _data.text);
                Navigator.pop(context);
              },
              child: Text(
                'Enviar',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.brown[800])),
            ),
          ],
        );
      },
    );
  }
}

Widget textEntry(controller, text) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 120, 144, 72),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: EdgeInsets.only(top: 5, bottom: 5),
    padding: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        labelText: text.toUpperCase(),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}