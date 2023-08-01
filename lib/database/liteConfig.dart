
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), DATABASE_NAME),
    onCreate: (db, version) async {
      // Executar o script de criação de tabelas
      print("Criando");
      await db.execute(CREATE_TABLE_ADDRES);
      await db.execute(CREATE_TABLE_ANNOTATION);
      await db.execute(CREATE_TABLE_CATTLE);
      await db.execute(CREATE_TABLE_EXPENSE);
      await db.execute(CREATE_TABLE_EXPENSE_HAS_CATTLE);
      await db.execute(CREATE_TABLE_IMAGE);
      await db.execute(CREATE_TABLE_TYPE);
      await db.execute(CREATE_TABLE_USER);
      await db.execute(CREATE_TABLE_WEIGHT);
    },
    version: 1,
  );
}