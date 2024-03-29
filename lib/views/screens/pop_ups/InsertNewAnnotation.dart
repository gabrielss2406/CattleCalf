// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously
import 'package:cattecalf/database/services/AnnotationServices.dart';
import 'package:cattecalf/models/CattleModel.dart';
import 'package:cattecalf/views/screens/mains/InsightsCow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewAnnotation extends StatefulWidget {
  final Cattle cattle; // Adicione essa propriedade

  const NewAnnotation({Key? key, required this.cattle}) : super(key: key);

  @override
  State<NewAnnotation> createState() => _NewAnnotationState();
}

class _NewAnnotationState extends State<NewAnnotation> {
  final _titulo = TextEditingController();
  var _data = DateTime.now();
  final _anotacao = TextEditingController();

  Future<void> _sendNewAnnotation(
      String reminder, String annotation, String date) async {
    try {
      await AnnotationServices.createAnnotation(
          reminder, annotation, date, widget.cattle.idCattle);
    } catch (error) {
      print(error);
      // Tratamento de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao enviar o registro.'),
        backgroundColor: Colors.red,
      ));
    } finally {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InsightsCow(cattle: widget.cattle),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
              ),
              SizedBox(width: 30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    iconSize: 30.0,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          backgroundColor: Color.fromARGB(255, 192, 216, 96),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textEntry(_titulo, 'titulo'),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 120, 144, 72),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            DateFormat('dd-MM-yyyy').format(_data),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            ).then(
                              (value) {
                                setState(() {
                                  _data = value!;
                                });
                              },
                            );
                          },
                          child: Icon(Icons.calendar_month),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[800],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                textEntry(_anotacao, 'anotacao')
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _sendNewAnnotation(_titulo.text, _anotacao.text,
                    DateFormat('dd-MM-yyyy').format(_data).toString());
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
