// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:fetin/database/services/EconomyServices.dart';
import 'package:flutter/material.dart';

class NewEconomy extends StatefulWidget {
  const NewEconomy({super.key});

  @override
  State<NewEconomy> createState() => _NewEconomyState();
}

class _NewEconomyState extends State<NewEconomy> {

  Future<void> _sendNewEconomy(int type, String date, String value) async {

    try {
      await EconomyServices.createEconomy(double.tryParse(value) ?? 0.0, date, type);
    } catch (error) {
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
        final _tipo = TextEditingController();
        final _data = TextEditingController();
        final _valor = TextEditingController();

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
                textEntry(_tipo, 'Tipo'),
                textEntry(_data, 'data'),
                textEntry(_valor, 'valor')
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _sendNewEconomy(int.parse(_tipo.text), _data.text, _valor.text);
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
