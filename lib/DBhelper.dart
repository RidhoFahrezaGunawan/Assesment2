// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/addata.dart';
import 'main.dart';
import 'AddDriverPage.dart';
import 'AddTransactionPage.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "opangatimin.db");
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE drivers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      license_plate TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE orders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      driver_name TEXT NOT NULL,
      date INTEGER NOT NULL,
      amount INTEGER NOT NULL
    )
  ''');
  }

  Future<void> insertDriver(Driver driver) async {
    final Database db = await database;
    await db.insert(
      'drivers',
      driver.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertOrder(Order order) async {
    final Database db = await database;
    await db.insert(
      'orders',
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Driver>> getDrivers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('drivers');
    return List.generate(maps.length, (i) {
      return Driver(
        id: maps[i]['id'],
        name: maps[i]['name'],
        licensePlate: maps[i]['license_plate'],
      );
    });
  }
}
