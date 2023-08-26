// doLogin
// verifyLogged
// logout

import 'package:fetin/constants/AppSharedPreferences.dart';

class AuthServices{

  static bool doLogin(String cpf, String password){
    AppSharedPreferences.saveUser(cpf);
    return true;
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