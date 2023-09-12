// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, avoid_init_to_null, unnecessary_null_comparison
import 'package:fetin/database/services/CattleServices.dart';
import 'package:fetin/models/CattleModel.dart';
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:fetin/views/widgets/selectionField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCow extends StatefulWidget {
  const NewCow({super.key});

  @override
  State<NewCow> createState() => _NewCowState();
}

class _NewCowState extends State<NewCow> {
  List<Cattle> cattleList = [];
  final _id = TextEditingController();
  final _raca = TextEditingController();
  var _data = DateTime.now();
  final _idpai = TextEditingController();
  final _idmae = TextEditingController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CattleServices.getCattleListByUser().then((value) {
        setState(() {
          cattleList = value;
        });

        final alertDialog = buildAlertDialogWithSelectionField(cattleList);
        showDialog(
          context: context,
          builder: (context) => alertDialog,
        );
      });
    });
  }

  void _updatePaiValue(String newValue) {
    setState(() {
      _idpai.text = newValue;
    });
  }
  void _updateMaeValue(String newValue) {
    setState(() {
      _idmae.text = newValue;
    });
  }


  Future<void> _sendNewCow(
      String? id, String breed, String date, String idDad, String idMom) async {
    try {
      await CattleServices.createCattle(
          id, breed, date, int.tryParse(idDad), int.tryParse(idMom));
    } catch (error) {
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
          builder: (context) => StartPage(),
        ),
      );
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
          'Novo Gado',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Color.fromARGB(255, 192, 216, 96),
      content: StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textEntry(_id, 'id'),
                textEntry(_raca, 'raça'),
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
                StyledSelectionField(
                    title: "Associar id mãe",
                    list: cattleList
                        .map((cattle) => '${cattle.idCattle} - ${cattle.breed}')
                        .toList(),
                    onChanged: _updateMaeValue,),
                StyledSelectionField(
                    title: "Associar id pai",
                    list: cattleList
                        .map((cattle) => '${cattle.idCattle} - ${cattle.breed}')
                        .toList(),
                    onChanged: _updatePaiValue,),
              ],
            ),
          );
        },
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _sendNewCow(
              _id.text,
              _raca.text,
              DateFormat('dd-MM-yyyy').format(_data).toString(),
              _idpai.text.replaceAll(RegExp(r'[^0-9]'), ''),
              _idmae.text.replaceAll(RegExp(r'[^0-9]'), ''),
            );
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
