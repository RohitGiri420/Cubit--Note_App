import 'package:flutter/cupertino.dart';

import '../DataBase/DbHelper.dart';
import '../Models/NoteModel.dart';

class NoteProvider extends ChangeNotifier{
  DbHelper db =DbHelper();
  List<NoteModel> arrlist=[];




  // updateData(NoteModel notesModel)async{
  //   var check = await db.UpdateData(notesModel);
  //   if(check){
  //     arrlist = await db.FetchData();
  //     notifyListeners();
  //   }
  // }

  fetchData() async {
    arrlist = await db.FetchData();
    notifyListeners();
  }


  List<NoteModel> getNotes(){
    fetchData();
    return arrlist;
  }

  addData(NoteModel notesModel) async {
    await db.addData(notesModel);

    arrlist = await db.FetchData();
    notifyListeners();

  }


  // deleteData(int Id) async{
  //   db.deleteNote(Id);
  //   arrlist =await db.FetchData();
  //   notifyListeners();
  // }
}