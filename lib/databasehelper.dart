import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:perumnas/lokasi.dart';

class DatabaseHelper{

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database>get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "lokasi.db");
    return await openDatabase(
        path,
        version:1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE table_lokasi(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lokasi_name TEXT
        )
        ''');
  }

  Future<List<Lokasi>> getLokasi() async{
    Database db = await instance.database;
    var agendas = await db.query('table_lokasi',orderBy: 'lokasi_name');
    List<Lokasi> agendaList = agendas.isNotEmpty?
    agendas.map((e) => Lokasi.fromMap(e)).toList():[];
    return agendaList;
  }

  Future<List<Lokasi>> seleksiLokasi(nama_lokasi) async{
    Database db = await instance.database;
    var agendas = await db.query(
        'table_lokasi',
        where: "lokasi_name like ?",
        whereArgs: ["%$nama_lokasi%"] ,
        orderBy: 'lokasi_name');
    List<Lokasi> agendaList =
    agendas.isNotEmpty?
    agendas.map((e) => Lokasi.fromMap(e)).toList()
        :
    [];
    return agendaList;
  }


  Future<int> addLokasi(Lokasi lokasi) async {
    Database db = await instance.database;
    return await db.insert("table_lokasi", lokasi.toMap());
  }

  Future<int> deleteLokasi(int id) async{
    Database db = await instance.database;
    return await db.delete("table_lokasi",where: "id = ?",whereArgs: [id] );
  }

  Future<int> editLokasi(Lokasi lokasi) async {
    Database db = await instance.database;
    return await db.update("table_lokasi", lokasi.toMap(),where: "id = ?", whereArgs: [lokasi.id] );
  }

}