import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "pokemon.db";
  static final _databaseVersion = 1;

  // 单例模式
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE artwork (
            id INTEGER PRIMARY KEY,
            artwork BLOB
          )
          ''');

    await db.execute('''
          CREATE TABLE simple_pokemon (
            id INTEGER PRIMARY KEY,
            data TEXT NOT NULL
          )
          ''');
  }

  // artwork table
  Future<void> insertArtwork(int id, ByteData data) async {
    final db = await database;
    await db.insert('artwork', {'id': id, 'artwork': data.buffer.asUint8List()},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query('artwork');
  }

  Future<int?> rowCount(table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<Uint8List?> getArtworkById(int id) async {
    Database db = await instance.database;
    List<Map> results =
        await db.query('artwork', where: 'id = ?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first['artwork'] as Uint8List?;
    }
    return null;
  }

  // simple_pokemon table
  Future<void> insertSimplePokemon(int id, String data) async {
    final db = await database;
    await db.insert('simple_pokemon', {'id': id, 'data': data},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map<String, dynamic>?> getJsonPokemonById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'simple_pokemon',
      columns: ['data'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return json.decode(result.first['data']);
    } else {
      return null;
    }
  }
}
