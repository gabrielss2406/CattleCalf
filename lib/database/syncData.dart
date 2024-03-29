import 'dart:convert';
import 'package:cattecalf/constants/Routes.dart';
import 'package:cattecalf/database/services/EconomyServices.dart';
import 'package:cattecalf/database/services/TypeServices.dart';
import 'package:cattecalf/database/services/WeightServices.dart';
import 'package:cattecalf/models/ExpenseModel.dart';
import 'package:cattecalf/models/WeightModel.dart';
import 'package:cattecalf/models/TypeModel.dart';
import 'package:http/http.dart' as http;

Future<void> synchronizeData() async {
  await synchronizeWeights();
  await synchronizeTypes();
  await synchronizeExpense();
}

Future<void> synchronizeTypes() async {
  final apiUrl = Uri.parse(Routes.syncTypes());

  final requestData = Type.convertTypeListToJSONList(await TypeServices.getAllTypes());

  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );

  print(response.body);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  } else {
    print('Erro na requisição: ${response.statusCode}');
  }
}

Future<void> synchronizeExpense() async {
  final apiUrl = Uri.parse(Routes.syncExpense());

  final requestData = Expense.convertExpenseListToJSONList(await EconomyServices.getAllExpense());

  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );

  print(response.body);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  } else {
    print('Erro na requisição: ${response.statusCode}');
  }
}

Future<void> synchronizeWeights() async {
  final apiUrl = Uri.parse(Routes.syncWeights());

  final requestData = Weight.convertWeightListToJSONList(await WeightServices.getAllWeight());

  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  } else {
    print('Erro na requisição: ${response.statusCode}');
  }
}