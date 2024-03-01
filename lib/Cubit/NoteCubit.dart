import 'dart:developer';
import 'package:cubit_note_app/Cubit/NoteState.dart';
import 'package:cubit_note_app/Model/NoteModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../DbHelper.dart';

class NoteCubit extends Cubit<NoteState> {
  DbHelper dbHelper;

  NoteCubit({required this.dbHelper}) : super(InitialState());

  AddData(NoteModle noteModle) async {
    emit(LoadingState());
    bool check = await dbHelper.AddData(noteModle);
    if (check) {
      var Notes = await dbHelper.FetchData();
      emit(LoadedState(arrlist: Notes,));
    }
    else {
      emit(ErrorState(ErrorMsg: "Error while adding data"));
    }
  }

  UpdateData(NoteModle noteModle) async {
    emit(LoadingState());
    bool check = await dbHelper.UpdateData(noteModle);
    if (check) {
      var Note = await dbHelper.FetchData();
      emit(LoadedState(arrlist: Note));
    }
    else{
      emit(ErrorState(ErrorMsg: "getting error while Updating data"));
    }
  }

  GetData() async {
    emit(LoadingState());
    var Notes = await dbHelper.FetchData();
    emit(LoadedState(arrlist: Notes));
  }

  DeleteData(int id) async{
    emit(LoadingState());
    await dbHelper.DeleteData(id);
    var Note = await dbHelper.FetchData();
    emit(LoadedState(arrlist: Note));
  }


}
