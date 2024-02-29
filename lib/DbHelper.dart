import 'dart:developer';
import 'dart:io';

import 'package:cubit_note_app/Model/NoteModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? _database;

  static String TABLENAME = "NoteTable";
  static String NOTEID = "NoteID";
  static String NOTETITLE = "Title";
  static String NOTEDESC = "Description";

  Future<Database> getDb() async {
    if (_database != null) {
      log("old dataBase ");
      return _database!;
    } else {
      log(" test ");
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    log("New dataBase is created");
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "NotesDb.db");
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create table $TABLENAME($NOTEID integer primary key autoincrement , $NOTETITLE text, $NOTEDESC text)");
      },
    );
    return _database!;
  }

  Future<void> AddData(NoteModle noteModle) async {
    var db = await getDb();
    await db.insert(TABLENAME, noteModle.toMap());
  }

  Future<void> UpdateData(NoteModle noteModle)async{
    var db = await getDb();
    await db.update(TABLENAME, noteModle.toMap(),where: "$NOTEID = ${noteModle.id}");

  }
  
  Future<void> DeleteData(int id) async{
    var db = await getDb();
    await db.delete(TABLENAME,where: "$NOTEID=?",whereArgs: [id.toString()]);
  }

  Future<List<NoteModle>> FetchData() async{
    var db = await getDb();
    List<NoteModle> arrList = [];
    var data = await db.query(TABLENAME);
    for(Map<String,dynamic> eachdata in data){
      NoteModle noteModle = NoteModle.fromMap(eachdata);
      arrList.add(noteModle);
    }
    return arrList;
  }
}
