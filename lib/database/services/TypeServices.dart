
import 'package:fetin/models/TypeModel.dart';
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

}