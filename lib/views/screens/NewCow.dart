// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class NewCow extends StatefulWidget {
  const NewCow({super.key});

  @override
  State<NewCow> createState() => _NewCowState();
}

class _NewCowState extends State<NewCow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        maxChildSize: 0.6,
        minChildSize: 0.2,
        initialChildSize: 0.6,
        builder: (BuildContext context, ScrollController scrollController) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 96, 72, 72),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 120, 144, 72),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          iconSize: 25,
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Form(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          insertData("RAÇA"),
                          insertData("ID"),
                          insertData("DATA"),
                          insertData("ID PAI"),
                          insertData("ID MAE"),
                          insertData("PESO"),
                          insertData("IMAGEM"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget insertData(String text) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(color: Colors.white),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.brown,
                Colors.brown,
                Color.fromARGB(255, 240, 240, 216),
                Color.fromARGB(255, 240, 240, 216)
              ],
              stops: [
                0.0,
                0.25,
                0.25,
                1.0
              ]),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            border: InputBorder.none,
            isCollapsed: true,
            contentPadding:
                EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 20)),
      ),
    ),
  );
}
