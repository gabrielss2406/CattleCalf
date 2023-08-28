
import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class EconomyServices{

  static Future<int> createEconomy() async {
    Database database = await getDatabase();

    String sql = 'SELECT * FROM type';
    var preCattleList = (await database.rawQuery(sql));

    //print(preCattleList);
    // ignore: unused_local_variable
    String cpf = await AppSharedPreferences.readUserCpf();
    /*

    String sql = 'INSERT INTO cattle(breed,birthDate,user_cpf) VALUES (?, ?, ?)';
    List<dynamic> args = [cpf];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;*/

    return preCattleList.length;
  }

}