// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';

class NewCow extends StatefulWidget {
  const NewCow({super.key});

  @override
  State<NewCow> createState() => _NewCowState();
}

class _NewCowState extends State<NewCow> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        final _raca = TextEditingController();
        final _id = TextEditingController();
        final _data = TextEditingController();
        final _idpai = TextEditingController();
        final _idmae = TextEditingController();
        final _peso = TextEditingController();
        final _img = TextEditingController();

        return AlertDialog(
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.brown[800],
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              'Novo registro',
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
                textEntry(_raca, 'Raça'),
                textEntry(_id, 'ID'),
                textEntry(_data, 'Data'),
                textEntry(_idpai, 'ID Pai'),
                textEntry(_idmae, 'ID Mãe'),
                textEntry(_peso, 'Peso'),
                textEntry(_img, 'Imagem'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
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
