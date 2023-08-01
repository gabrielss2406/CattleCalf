// Define a function that inserts dogs into the database
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';
import '../../models/AnnotationModel.dart';

Future<void> createAnnotation(Annotation annotation) async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'annotation',
    annotation.toMap(),
  );
}


Future<List<Annotation>> readAnnotation() async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('annotation');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Annotation(
      idAnnotation: maps[i]['idAnnotation'],
      annotation: maps[i]['annotation'],
      date: maps[i]['date'],
      reminder: maps[i]['reminder'],
    );
  });
}