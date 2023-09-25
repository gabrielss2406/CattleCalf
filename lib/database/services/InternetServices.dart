import 'dart:convert';

import 'package:cattecalf/models/SimpleModel.dart';
import 'package:http/http.dart' as http;
import 'package:cattecalf/constants/Routes.dart';

class InternetServices {
  Future<double> getArroba() async {
    final apiUrl = Uri.parse(Routes.arroba());
    final response = await http.get(apiUrl);

    double price = (json.decode(response.body))["Price of Arroba"];

    print(response.body);

    return price;
  }

  Future<List<SimpleObject>> weightAnalysis() async {
    final apiUrl = Uri.parse(Routes.weightAnalysis());
    final response = await http.get(apiUrl);

    final jsonResponse = json.decode(response.body);

    SimpleObject obj1 =
        SimpleObject(id: 1, name: "Média", value: jsonResponse["Average"]);
    SimpleObject obj2 =
        SimpleObject(id: 2, name: "Variância", value: jsonResponse["Variance"]);
    SimpleObject obj3 = SimpleObject(
        id: 3,
        name: "Desvio Padrão",
        value: jsonResponse["Standard Deviation"]);

    final List<SimpleObject> objList = [obj1, obj2, obj3];

    return objList;
  }

  Future<List<SimpleObject>> expenseAnalysis() async {
    final apiUrl = Uri.parse(Routes.expenseAnalysis());
    final response = await http.get(apiUrl);

    final jsonResponse = json.decode(response.body);

    SimpleObject obj1 = SimpleObject(
        id: 1,
        name: "Soma dos gastos (R\$)",
        value: jsonResponse["Expense(R\$)"]);
    SimpleObject obj2 = SimpleObject(
        id: 2, name: "Soma dos pesos (Kg)", value: jsonResponse["Weight(Kg)"]);
    SimpleObject obj3 = SimpleObject(
        id: 3, name: "Custo", value: jsonResponse["Cost (R\$/Kg)"]);

    final List<SimpleObject> objList = [obj1, obj2, obj3];

    return objList;
  }
}
