
import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/CattleModel.dart';
import '../liteConfig.dart';

class CattleServices{

  static Future<List<Cattle>> getCattleListByUser() async {
    Database database = await getDatabase();

    //String sql3 = 'INSERT INTO user VALUES ("02126632679", "Gabriel", "senha", "gabriel@email", "5532984451415");';
    //await database.rawInsert(sql3);
    
    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = 'SELECT * FROM cattle WHERE user_cpf = ?';
    List<dynamic> args = [cpf];
    var preCattleList = (await database.rawQuery(sql,args));

    return Cattle.fromJsonList(preCattleList);
  }

  static Future<int> createCattle(String? idCattle, String breed, String date, int? idDad, int? idMom) async {

    assert(breed != "", "Erro");
    assert(date != "", "Erro");

    Database database = await getDatabase();
    
    String cpf = await AppSharedPreferences.readUserCpf();

    String sql;
    List<dynamic> args;

    if(idCattle==null || idCattle==""){
      sql = 'INSERT INTO cattle(breed,birthDate,user_cpf,cattle_idCattle_sire,cattle_idCattle_dam) VALUES (?, ?, ?, ?, ?)';
      args = [breed, date, cpf, idDad, idMom];
    } else {
      sql = 'INSERT INTO cattle(idCattle,breed,birthDate,user_cpf,cattle_idCattle_sire,cattle_idCattle_dam) VALUES (?, ?, ?, ?, ?, ?)';
      args = [idCattle, breed, date, cpf, idDad, idMom];
    }
    int insertStatus = await database.rawInsert(sql,args);

    print(insertStatus);

    return insertStatus;
  }

}