<<<<<<< HEAD
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

Database db;

void main() async 
{
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'tasks.db'),
    onCreate: (db, version)
    {
      return db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, discription TEXT, amount INTEGER, date TEXT)");
    },
    version: 1,
  );

  Future<void> insertTask(Task task) async 
  {
    final Database db = await database;
    await db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async
  {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) 
    {
      return Task
      (
        id: maps[i]['id'],
        name: maps[i]['name'],
        discription: maps[i]['discription'],
        amount: maps[i]['amount'],
        date: maps[i]['date'],
      );
    });
  }

  Future<void> updateTask(Task task) async 
  {
    final Database db = await database;
    await db.update('tasks', task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> deleteDog(Task task) async 
  {
    await db.delete('tasks', where: "id = ?", whereArgs: [task.id]); 
  }
}

class Task
{
  final int id;
  final String name;
  final String discription;
  final int amount;
  final String date;

  Task({this.id, this.name, this.discription, this.amount, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'name': name,
      'discription': discription,
      'amount': amount,
      'date': date,
    };
  }

  @override
  String toString() 
  {
    return 'Task{id: $id, name: $name, discription: $discription, amount: $amount, date: $date}';
  }
}
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Persist extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    
  }
}

>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
