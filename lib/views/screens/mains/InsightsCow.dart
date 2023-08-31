// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/database/services/AnnotationServices.dart';
import 'package:fetin/database/services/WeightServices.dart';
import 'package:fetin/models/AnnotationModel.dart';
import 'package:fetin/models/CattleModel.dart';
import 'package:fetin/models/WeightModel.dart';
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:fetin/views/screens/pop_ups/InsertNewAnnotation.dart';
import 'package:fetin/views/screens/pop_ups/InsertNewWeight.dart';
import 'package:fetin/views/widgets/cardAnnotation.dart';
import 'package:fetin/views/widgets/cardWeight.dart';
import 'package:flutter/material.dart';
import 'package:fetin/views/widgets/appBar.dart';

class InsightsCow extends StatefulWidget {
  final Cattle cattle; // Adicione essa propriedade

  const InsightsCow({Key? key, required this.cattle}) : super(key: key);

  @override
  State<InsightsCow> createState() => _InsightsCowState();
}

class _InsightsCowState extends State<InsightsCow> {
  List<Weight> weightList = [];
  List<Annotation> annotationList = [];

  @override
  initState() {
    super.initState();
    // Exec async funcions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WeightServices.getWeightList(widget.cattle.idCattle).then(
        (value) {
          weightList = value;
          setState(() {});
        },
      );

      AnnotationServices.getAnnotationList(widget.cattle.idCattle).then(
        (value) {
          annotationList = value;
          setState(() {});
        },
      );
    });
  }

  void _openWidget(BuildContext context, int option) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(125, 0, 0, 0),
      isScrollControlled: true,
      builder: (BuildContext context) {
        if(option==1) {
          return NewWeight(idCattle: widget.cattle.idCattle);
        } else {
          return NewAnnotation(idCattle: widget.cattle.idCattle);
        }
      },
    );
  }

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
                        child: iconId(widget.cattle.idCattle.toString()),
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
                  widget.cattle.breed,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 680,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 120, 144, 72),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Ink(
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: () => _openWidget(context, 1),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: weightList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.all(0),
                                        child: CardThree(
                                          weight: weightList[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 120, 144, 72),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Ink(
                                        child: IconButton(
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                          onPressed: () => _openWidget(context, 2),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: annotationList.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.all(0),
                                              child: CardFour(
                                                annotation: annotationList[index],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
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
                                      children: [
                                        iconId(
                                            "${widget.cattle.cattle_idCattle_sire}\nPai"),
                                        iconId(
                                            "${widget.cattle.cattle_idCattle_dam}\nMãe")
                                      ]),
                                ))
                          ],
                        ),
                      ),
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
                textAlign: TextAlign.center,
                text.contains("null") ? "" : text,
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
