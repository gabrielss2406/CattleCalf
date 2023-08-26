import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{
  static saveUser(String cpf) async {
    // user = 0, cliente -- user = 1, prestador
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("cpf", cpf);
  }
  static readUserCpf() async {
    final prefs = await SharedPreferences.getInstance();
    //json.decode to convert json string back to Json Object
    return prefs.getString("cpf");
  }
}