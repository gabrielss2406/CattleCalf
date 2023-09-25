
import 'package:cattecalf/models/AnnotationModel.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class AnnotationServices{

  static Future<List<Annotation>> getAnnotationList(int? idCattle) async {
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'SELECT * FROM annotation WHERE cattle_idCattle = ? ORDER BY date DESC';
    List<dynamic> args = [idCattle];
    var preAnnotationList = (await database.rawQuery(sql,args));

    return Annotation.fromJsonList(preAnnotationList);
  }

  static Future<int> createAnnotation(String reminder, String annotation, String date, int? idCattle) async {

    assert(reminder != "", "Erro");
    assert(annotation != "", "Erro");
    assert(idCattle != null && idCattle != 0, "Erro");

    Database database = await getDatabase();

    String sql = 'INSERT INTO annotation (reminder, annotation, date, cattle_idCattle) VALUES (?, ?, ?, ?);';
    List<dynamic> args = [reminder, annotation, date, idCattle];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;
  }

}