
import 'package:cattecalf/constants/VerifyFields.dart';
import 'package:cattecalf/models/WeightModel.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class WeightServices{

  static Future<List<Weight>> getWeightList(int? idCattle) async {
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'SELECT * FROM weighing WHERE cattle_idCattle = ? ORDER BY date DESC';
    List<dynamic> args = [idCattle];
    var preWeightList = (await database.rawQuery(sql,args));

    return Weight.fromJsonList(preWeightList);
  }

  static Future<int> createWeight(String weight, String date, int? idCattle) async {

    assert(weight != "", "Erro");
    assert(isNumeric(weight), "Erro");
    assert(date != "", "Erro");
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'INSERT INTO weighing (weight, date, cattle_idCattle) VALUES (?, ?, ?);';
    List<dynamic> args = [weight, date, idCattle];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;
  }

  static Future<List<Weight>> getAllWeight() async {
    Database database = await getDatabase();

    String sql = 'SELECT * FROM weighing';
    var preWeightList = (await database.rawQuery(sql));
    
    return Weight.fromJsonList(preWeightList);
  }

}