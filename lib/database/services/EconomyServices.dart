
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

    print(preCattleList);

    return Expense.fromJsonList(preCattleList);
  }

  static Future<int> createEconomy(double amount, String date) async {
    assert(date != "", "Erro");

    Database database = await getDatabase();

    String cpf = await AppSharedPreferences.readUserCpf();

    String sql = 'INSERT INTO expense(amount,date,type_idType,user_cpf) VALUES (?, ?, 1, ?)';
    List<dynamic> args = [amount, date, cpf];
    int insertStatus = await database.rawInsert(sql,args);

    return insertStatus;
  }

}