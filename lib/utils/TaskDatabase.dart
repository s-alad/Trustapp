import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/Task.dart';

class TaskDatabase
{
  static TaskDatabase _taskDatabase;
  static Database _database;        

	String _taskTable = 'task_table';
	String _id = 'id';
	String _name = 'name';
  String _date = 'date';
  String _level = 'level';
  String _state = 'state';

  TaskDatabase._createInstance();

  factory TaskDatabase()
  {
    if (_taskDatabase == null) {_taskDatabase = TaskDatabase._createInstance();}
    return _taskDatabase;
  }

  Future<Database> get database async 
  {
    if (_database == null) {_database = await initializeDatabase();}
    return _database;
  }

  Future<Database> initializeDatabase() async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'tasks.db';

    var tasksDatabase = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return tasksDatabase;
  }

  void _createDatabase(Database database, int newVersion) async
  {
    await database.execute('''
      CREATE TABLE $_taskTable (
        $_id INTEGER PRIMARY KEY AUTOINCREMENT, 
        $_name TEXT, 
        $_date TEXT,
        $_level INTEGER,
        $_state INTEGER)''');

    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task1", "tmm", 0, 0)');
    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task2", "tmm", 0, 1)');
    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task3", "tmm", 0, 0)');
    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task4", "tmm", 0, 0)');
    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task5", "tmm", 0, 1)');
    await database.rawInsert('INSERT INTO $_taskTable ($_name, $_date, $_level, $_state) VALUES("task4", "tmm", 0, 0)');
  }
  
  Future<List<Map<String, dynamic>>> getTasksMap() async 
  {
    Database db = await this.database;
    var result = await db.query(_taskTable);
    /* result.forEach((row) => print(row)); //prints da database */
    return result;
  }

  Future<int> insertTask(Task task) async //return value is id of inserted row
  {
		Database db = await this.database;
		var result = await db.insert(_taskTable, task.toMap());
		return result;
	}

  Future<int> updateTask(Task task) async 
  {
		Database db = await this.database;
		var result = await db.update(_taskTable, task.toMap(), where: '$_id = ?', whereArgs: [task.id]);
		return result;
	}

	Future<int> deleteTask(int id) async 
  {
		Database db = await this.database;
		int result = await db.rawDelete('DELETE FROM $_taskTable WHERE $_id = $id');
		return result;
	}

	Future<int> getSize() async 
  {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $_taskTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

  Future<List<Task>> getTasksList() async 
  {
		var taskMapList = await getTasksMap();
		List<Task> taskList = List<Task>();

		for (int i = 0; i < taskMapList.length; i++) 
    {
			taskList.add(Task.fromMapObject(taskMapList[i]));
		}

		return taskList;
	}
}