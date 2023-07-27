// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:fetin/views/widgets/appBar.dart';

class InsightsCow extends StatefulWidget {
  const InsightsCow({super.key});

  @override
  State<InsightsCow> createState() => _InsightsCowState();
}

class _InsightsCowState extends State<InsightsCow> {
  void navigateToNewPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        popUpPage: 2,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 54, 28, 7),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Align(
                    child: Image.asset(
                      'assets/cow.png',
                      fit: BoxFit.cover,
                      height: 2000,
                      width: 5000,
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(97, 54, 28, 7),
                  ),
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: iconId("33"),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 5),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: navigateToNewPage,
                      ),
                    ),
                  )
                ],
              ),
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Azuebuado',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 700,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 120, 144, 72),
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 120, 144, 72),
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      EdgeInsets.only(right: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 120, 144, 72),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [iconId("32"), iconId("24")]),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 120, 144, 72),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconId(String text) {
    return Stack(
      children: [
        Image.asset(
          'assets/brinco.png',
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
