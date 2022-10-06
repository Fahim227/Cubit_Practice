


import 'package:cv_project/model/cv_model.dart';
import 'package:sqflite/sqflite.dart';



import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Make a Singleton instance of DatabaseHelper
  // the singleton pattern is a software design pattern that,
  // restricts the instantiation of a class to one "single" instance.
  // This is useful when exactly one object is needed to coordinate actions across the system.
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Initialize the database name
  // and define a Database instance
  static String dbName = 'Database.db';
  static Database? _database;


  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String directoryPath = await getDatabasesPath();
    String path = join(directoryPath, DatabaseHelper.dbName);
    return await openDatabase(path, version: 17,
        onCreate: _createDatabase,
        onUpgrade: (Database? db, int oldVersion, int newVersion) {
          print(newVersion);
          if (oldVersion < newVersion) {
            // you can execute drop table and create table
            // _addColumnInEventTable(db!);
          }
        });
  }


  void _createDatabase(Database db, int version) async {
    await db.execute('CREATE TABLE ${CVModelFields.tableName} (${CVModelFields.id} INTEGER PRIMARY KEY,'
        ' ${CVModelFields.applicant_name} TEXT,'
        ' ${CVModelFields.DateofBirth} TEXT,'
        ' ${CVModelFields.identityType} TEXT,'
        ' ${CVModelFields.identityNumber} TEXT,'
        ' ${CVModelFields.identityImage} TEXT )');
  }

  Future<int> insertCV(CVModel cvModel) async {
    // String query = 'INSERT INTO ${CustomerTypeFields.tableName} (name,type) VALUES(${customerType.name},${customerType.type});';
    Database? db = await instance.database;
    int type_id = await db!.insert(CVModelFields.tableName!,cvModel.toMap());
    return type_id;
  }

  Future<List<CVModel> > getAllCV() async{
    // String query = 'INSERT INTO ${CustomerTypeFields.tableName} (name,type) VALUES(${customerType.name},${customerType.type});';
    Database? db = await instance.database;
    List<Map<String, dynamic>> map  = await db!.rawQuery("SELECT * FROM ${CVModelFields.tableName}");
    List<CVModel> allCVS = map.map((e) => CVModel.fromMap(e)).toList();
    return allCVS;
  }




}