
import 'package:fetin/models/AnnotationModel.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class AnnotationServices{

  static Future<List<Annotation>> getAnnotationList(int? idCattle) async {
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'SELECT * FROM annotation WHERE cattle_idCattle = ? ORDER BY date DESC';
    List<dynamic> args = [idCattle];
    var preWeightList = (await database.rawQuery(sql,args));

    return Annotation.fromJsonList(preWeightList);
  }

  static Future<int> createAnnotation(String reminder, String annotation, int? idCattle) async {

    assert(reminder != "", "Erro");
    assert(annotation != "", "Erro");
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'INSERT INTO annotation (reminder, annotation, cattle_idCattle) VALUES (?, ?, ?);';
    List<dynamic> args = [reminder, annotation, idCattle];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;
  }

}