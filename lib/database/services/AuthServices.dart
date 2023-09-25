// doLogin
// verifyLogged
// logout

import 'dart:convert';

import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:fetin/constants/Routes.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<bool> doLogin(String email, String password) async {
    final apiUrl = Uri.parse(Routes.login());
    final response = await http
        .post(apiUrl,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: json.encode({
              "login": {
                "email": email, "password": password
              }}))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 202) {
      return false;
    } else {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      await AppSharedPreferences.saveUser(parsedJson['cpf']);
      return true;
    }
  }

  static Future<bool> register(
      String email,
      String name,
      String cpf,
      String address,
      String telefone,
      String password,
      String passwordTwo) async {
    final apiUrl = Uri.parse(Routes.register());
    final response = await http.post(apiUrl,
        body: json.encode({
          "user": {
            "email": email,
            "name": name,
            "cpf": cpf,
            "addres": address,
            "phone": telefone,
            "password": password
          }
        }));

    print("resposta: ");
    print(response.body);

    if (response.statusCode != 201) {
      throw Error;
    } else {
      return true;
    }
  }

  static logout(context) async {
    AppSharedPreferences.saveUser("");
  }

  static Future<bool> verifyLogged() async {
    dynamic user = await AppSharedPreferences.readUserCpf();
    print(user);
    if (user == null || user == "") {
      return false;
    } else {
      return true;
    }
  }
}
