import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/src/models/scann_model.dart';
import 'package:sqflite/sqflite.dart';

export 'package:qr_reader/src/models/scann_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
    }
  }

  Future<Database> initDB() async {
    //Path donde se almacenara la BD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //crear la base de datos
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
          ''');
    });
  }

  //metodo donde se toca el SQL puro
  // Future<int> nuevoScanRaw(ScannModel nuevoScan)async{
  //
  //   final id    =nuevoScan.id;
  //   final tipo  =nuevoScan.tipo;
  //   final valor =nuevoScan.valor;
  //
  //   final db=await getDatabase;
  //
  //   final resp=await db.rawInsert('''
  //   INSERT INTO Scans(id,tipol,valor)
  //     VALUES($id,'$tipo','$valor')
  //   ''');
  //   return resp;
  // }

  /// PARA INSERTAR DATOS
  Future<int> nuevoScan2(ScannModel nuevoScan) async {
    final db = await getDatabase;
    final resp = await db.insert('Scans', nuevoScan.toJson());
    return resp;
  }

  Future<ScannModel> getScanById(int id) async {
    final db = await getDatabase;
    final resp= await db.query('Scans',where: 'id=?',whereArgs: [id]);
    return resp.isNotEmpty?ScannModel.fromJson(resp.first):null;
  }

  Future<List<ScannModel>> getAllScans() async {
    final db = await getDatabase;
    final resp= await db.query('Scans');
    return resp.isNotEmpty
        ?resp.map((e) => ScannModel.fromJson(e)).toList()
        :[null];
  }
  Future<List<ScannModel>> getAllScansbyType(String tipo) async {
    final db = await getDatabase;
    final resp= await db.query('Scans',where: 'tipo=?',whereArgs: [tipo]);
    return resp.isNotEmpty
        ?resp.map((e) => ScannModel.fromJson(e)).toList()
        :[];
  }

  Future<int> updateScan(ScannModel toupdateScan)async{
    final db=await getDatabase;
    final resp= await db.update('Scans', toupdateScan.toJson(),where: 'id=?',whereArgs: [toupdateScan.id]);
    return resp;
  }

  Future<int> deleteScanById(int id)async{
    final db=await getDatabase;
    final resp= await db.delete('Scans',where: 'id=?',whereArgs: [id]);
    return resp;
  }

  Future<int> deleteScansAll()async{
    final db=await getDatabase;
    final resp= await db.delete('Scans');
    return resp;
  }


}
