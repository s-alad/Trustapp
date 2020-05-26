import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/Goal.dart';

class GoalDatabase
{
  static GoalDatabase _goalDatabase;
  static Database _database;        

	String _goalTable = 'goal_table';
	String _id = 'id';
	String _name = 'name';
	String _description = 'description';
	String _amount = 'amount';
	String _date = 'date';

  GoalDatabase._createInstance();

  factory GoalDatabase()
  {
    if (_goalDatabase == null) {_goalDatabase = GoalDatabase._createInstance();}
    return _goalDatabase;
  }

  Future<Database> get database async 
  {
    if (_database == null) {_database = await initializeDatabase();}
    return _database;
  }

  Future<Database> initializeDatabase() async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'goals.db';

    var goalsDatabase = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return goalsDatabase;
  }

  void _createDatabase(Database database, int newVersion) async
  {
    await database.execute('''
      CREATE TABLE $_goalTable (
        $_id INTEGER PRIMARY KEY AUTOINCREMENT, 
        $_name TEXT, 
        $_amount INTEGER,  
        $_date TEXT,
        $_description TEXT)''');

    await database.rawInsert('INSERT INTO $_goalTable ($_name, $_description, $_amount, $_date) VALUES("goal", "test", 1, "today")');
    await database.rawInsert('INSERT INTO $_goalTable ($_name, $_description, $_amount, $_date) VALUES("goal2", "test", 2, "today")');
    await database.rawInsert('INSERT INTO $_goalTable ($_name, $_description, $_amount, $_date) VALUES("goal3", "test", 3, "today")');
  }
  
  Future<List<Map<String, dynamic>>> getGoalsMap() async 
  {
    Database db = await this.database;
    var result = await db.query(_goalTable);
    /* result.forEach((row) => print(row)); //prints da database */
    return result;
  }

  Future<int> insertGoal(Goal goal) async //return value is id of inserted row
  {
		Database db = await this.database;
		var result = await db.insert(_goalTable, goal.toMap());
		return result;
	}

  Future<int> updateGoal(Goal goal) async 
  {
		Database db = await this.database;
		var result = await db.update(_goalTable, goal.toMap(), where: '$_id = ?', whereArgs: [goal.id]);
		return result;
	}

	Future<int> deleteGoal(int id) async 
  {
		Database db = await this.database;
		int result = await db.rawDelete('DELETE FROM $_goalTable WHERE $_id = $id');
		return result;
	}

	Future<int> getSize() async 
  {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $_goalTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

  Future<List<Goal>> getGoalsList() async 
  {
		var goalMapList = await getGoalsMap();
		List<Goal> goalList = List<Goal>();

		for (int i = 0; i < goalMapList.length; i++) 
    {
			goalList.add(Goal.fromMapObject(goalMapList[i]));
		}

		return goalList;
	}
}