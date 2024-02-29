import 'package:cubit_note_app/DbHelper.dart';

class NoteModle {
  DbHelper db = DbHelper();
  int? id;
  String title;
  String Description;

  NoteModle({required this.title, required this.Description, this.id});

  factory NoteModle.fromMap(Map<String, dynamic> map) {
    return NoteModle(title: map[DbHelper.NOTETITLE], Description: map[DbHelper.NOTEDESC], id: map[DbHelper.NOTEID]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.NOTEID:id,
      DbHelper.NOTETITLE:title,
      DbHelper.NOTEDESC:Description,
    };
  }
}
