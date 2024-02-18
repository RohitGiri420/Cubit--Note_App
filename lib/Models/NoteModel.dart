import 'package:cubit_note_app/DataBase/DbHelper.dart';

class NoteModel{
  int? Id;
  String title;
  String description;

  NoteModel({required this.title,required this.description,this.Id});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(title: map[DbHelper.NOTETITLE], description: map[DbHelper.NOTEDESC],Id: map[DbHelper.NOTEID]);
  }

  Map<String,dynamic>toMap(){
    return{
      DbHelper.NOTETITLE:Id,
      DbHelper.NOTETITLE:title,
      DbHelper.NOTEDESC:description,
    };
  }
}