
import 'package:fetin/constants/AppSharedPreferences.dart';
import 'package:fetin/models/ExpenseModel.dart';
import 'package:sqflite/sqflite.dart';

import '../liteConfig.dart';

class EconomyServices{

  static Future<List<Expense>> getExpenseListByUser() async {
    Database database = await getDatabase();
    
    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = 'SELECT * FROM expense WHERE user_cpf = ?';
    List<dynamic> args = [cpf];
    var preCattleList = (await database.rawQuery(sql,args));

    return Expense.fromJsonList(preCattleList);
  }

  static Future<int> createEconomy(double amount, String date, int type) async {
    assert(date != "", "Erro");
    assert(type != 0, "Erro");

    Database database = await getDatabase();

    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = 'INSERT INTO expense(amount,date,type_idType,user_cpf) VALUES (?, ?, ?, ?)';
    List<dynamic> args = [amount, date, type, cpf];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;
  }

}