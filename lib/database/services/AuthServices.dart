// doLogin
// verifyLogged
// logout

import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:fetin/constants/Routes.dart';
import 'package:fetin/views/screens/mains/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices{

  static Future<bool> doLogin(String cpf, String password) async{
    final apiUrl = Uri.parse(Routes.login());
    final response = await http.post(apiUrl);

    print(response.body);

    if(response.statusCode!=202){
      throw Error;
    } else {
      return true;
    }

  }

  static logout(context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
    AppSharedPreferences.saveUser("");
  }

  static Future<bool> verifyLogged() async {
    dynamic user = await AppSharedPreferences.readUserCpf();
    
    if(user == null || user == ""){
      return false;
    } else {
      return true;
    }
  }

}