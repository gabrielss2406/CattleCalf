
import 'package:cattecalf/constants/AppSharedPreferences.dart';
import 'package:cattecalf/models/TypeModel.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class TypeServices{

  static Future<List<Type>> getTypeById(int id) async {
    Database database = await getDatabase();

    String sql = 'SELECT * FROM type WHERE idType = ?';
    List<dynamic> args = [id];
    var preCattleList = (await database.rawQuery(sql,args));

    return Type.fromJsonList(preCattleList);
  }

  static Future<List<Map<String, Object?>>> getTypeList() async {
    Database database = await getDatabase();
    
    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = """
      SELECT t.name AS type_name, SUM(e.amount) AS total_expenses
      FROM type t
      LEFT JOIN expense e ON t.idType = e.type_idType
      WHERE e.user_cpf = ?
      GROUP BY t.name
      ORDER BY t.idType ASC
    """;
    List<dynamic> args = [cpf];
    var preCattleList = (await database.rawQuery(sql,args));

    return preCattleList;
  }

  static Future<List<Type>> getTypes() async {
    Database database = await getDatabase();

    String sql = 'SELECT * FROM type';
    var preCattleList = (await database.rawQuery(sql));

    return Type.fromJsonList(preCattleList);
  }

  static Future<List<Type>> getAllTypes() async {
    Database database = await getDatabase();

    String sql = 'SELECT * FROM type';
    var preTypeList = (await database.rawQuery(sql));

    return Type.fromJsonList(preTypeList);
  }
}