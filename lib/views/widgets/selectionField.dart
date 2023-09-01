import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyledSelectionField extends StatefulWidget {
  final String title;
  List<String> list = [];


  StyledSelectionField({Key? key, required this.title, required this.list}) : super(key: key);

  @override
  _StyledSelectionFieldState createState() => _StyledSelectionFieldState();
}

class _StyledSelectionFieldState extends State<StyledSelectionField> {
  String selectedOption = ''; // Valor inicial selecionado
  List<String> uniqueList = [];
  DropdownController<String> dropdownController = DropdownController<String>();

  @override
  void initState() {
    super.initState();
    uniqueList = widget.list.toSet().toList(); // Remove duplicatas da lista
    uniqueList.insert(0, "0 - Nenhum");
    dropdownController.setSelectedValue(uniqueList[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 120, 144, 72),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.all(5),
      child: DropdownButtonFormField<String>(
        value: dropdownController.selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownController.setSelectedValue(newValue!);
          });
        },
        items: uniqueList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16, // Tamanho da fonte
              ),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16, // Tamanho da fonte do label
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent), // Remove o sublinhado
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent), // Remove o sublinhado
          ),
        ),
        dropdownColor: const Color.fromARGB(255, 120, 144, 72), // Cor do menu suspenso
        style: const TextStyle(
          color: Colors.white, // Cor do texto selecionado
        ),
      ),
    );
  }
}

class DropdownController<T> {
  T? selectedValue;
  
  void setSelectedValue(T value) {
    if (value != selectedValue) {
      selectedValue = value;
    }
  }
}