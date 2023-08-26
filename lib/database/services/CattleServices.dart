
import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/CattleModel.dart';
import '../liteConfig.dart';

class CattleServices{

  static Future<List<Cattle>> getCattleListByUser() async {
    Database database = await getDatabase();

    // TEMP Insert
    //String sql1 = 'INSERT INTO cattle(breed,birthDate,user_cpf) VALUES ("", "2023-08-26", "02126632679")';
    //await database.rawInsert(sql1);
    //String sql2 = 'INSERT INTO cattle(breed,birthDate,user_cpf) VALUES ("", "2023-08-26", "02126632679")';
    //await database.rawInsert(sql2);
    

    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = 'SELECT * FROM cattle WHERE user_cpf = ?';
    List<dynamic> args = [cpf];
    var preCattleList = (await database.rawQuery(sql,args));

    return Cattle.fromJsonList(preCattleList);
  }

}