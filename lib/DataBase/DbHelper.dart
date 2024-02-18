import 'dart:io';

import 'package:cubit_note_app/Models/NoteModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  DbHelper db = DbHelper();

  static String TABLENAME="Note Table";
  static String NOTEID="Note Id";
  static String NOTETITLE="TITLE";
  static String NOTEDESC="Description";

  Database? _database;

  Future<Database>getDb() async{
    if(_database!=null){
      return _database!;
    }
    else{
      Directory directory = await getApplicationDocumentsDirectory();
      var path = join(directory.path,"NoteDb.db");
      return openDatabase(path,version: 1,onCreate: (db, version) {
        db.execute("CREATE TABLE $TABLENAME($NOTEID INTEGER PRIMARY KEY AUTOINCREMENT, $NOTETITLE TEXT, $NOTEDESC TEXT)");
      },);
    }
  }

  Future addData(NoteModel noteModel)async{
    var db =await getDb();
    await db.insert(TABLENAME,noteModel.toMap());
  }

  Future<List<NoteModel>> FetchData() async{
    var db = await getDb();
    List<NoteModel> arrlist=[];
    var data = await db.query(TABLENAME);
    for(Map<String,dynamic>eachdata in data){
      var data = NoteModel.fromMap(eachdata);
      arrlist.add(data);
    }
    return arrlist;
  }

  Future UpdateData(NoteModel noteModel) async{
    var db = await getDb();
    await db.update(TABLENAME, noteModel.toMap(),where: "$NOTEID = ${noteModel.Id}");
  }

  Future DeleteData(int id) async{
    var db = await getDb();
    await db.delete(TABLENAME,where: "$NOTEID=?",whereArgs: [id.toString()]);
  }
}