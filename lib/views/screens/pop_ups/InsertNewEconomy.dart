// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously
import 'package:fetin/database/services/CattleServices.dart';
import 'package:fetin/database/services/EconomyServices.dart';
import 'package:fetin/models/CattleModel.dart';
import 'package:fetin/views/widgets/selectionField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEconomy extends StatefulWidget {
  const NewEconomy({super.key});

  @override
  State<NewEconomy> createState() => _NewEconomyState();
}

class _NewEconomyState extends State<NewEconomy> {
  List<Cattle> cattleList = [];
  final _tipo = TextEditingController();
  var _data = DateTime.now();
  final _valor = TextEditingController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CattleServices.getCattleListByUser().then((value) {
        setState(() {
          cattleList = value;
        });
        // Quando a lista cattleList estiver pronta, crie e mostre o AlertDialog
        final alertDialog = buildAlertDialogWithSelectionField(cattleList);
        showDialog(
          context: context,
          builder: (context) => alertDialog,
        );
      });
    });
  }

  Future<void> _sendNewEconomy(int type, String date, String value) async {
    try {
      await EconomyServices.createEconomy(
          double.tryParse(value) ?? 0.0, date, type);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao enviar o registro.'),
        backgroundColor: Colors.red,
      ));
    } finally {
      Navigator.pop(context);
    }
  }

  AlertDialog buildAlertDialogWithSelectionField(List<Cattle> cattleList) {
    return AlertDialog(
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.brown[800], borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          'Novo Gasto',
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
            textEntry(_valor, 'valor'),
            StyledSelectionField(
                title: "Associar gado ao gasto",
                list: cattleList
                    .map((cattle) => '${cattle.idCattle} - ${cattle.breed}')
                    .toList()),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _sendNewEconomy(
              int.tryParse(_tipo.text) ?? 0,
              DateFormat('dd-MM-yyyy').format(_data).toString(),
              _valor.text,
            );
            Navigator.pop(context);
          },
          child: Text(
            'Enviar',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.brown[800])),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
}
