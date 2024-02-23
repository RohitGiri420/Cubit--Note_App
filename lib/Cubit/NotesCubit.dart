import 'package:cubit_note_app/Cubit/States.dart';
import 'package:cubit_note_app/DataBase/DbHelper.dart';
import 'package:cubit_note_app/Models/NoteModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NoteState>{
  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}):super(initialState());


  AddData(NoteModel noteModel) async{
    emit(LoadingState());
    bool check = await DbHelper().addData(noteModel);
    if(check){
      var Note = await DbHelper().FetchData();
      emit(LoadedState(arrlist: Note));
    }
    else{
      emit(errorState(errorMessage: "error while adding adding data"));
    }
  }

  FetchData() async{
    emit(LoadingState());
    var Notes = await  DbHelper().FetchData();
    emit(LoadedState(arrlist: Notes));
  }

  UpdateData(NoteModel noteModel) async{
    emit(LoadingState());
    var check = await DbHelper().UpdateData(noteModel);

    if(check){
    var Note = await DbHelper().FetchData();
    emit(LoadedState(arrlist: Note));
    }
    else{
      emit(errorState(errorMessage: "getting error while updating data"));
    }
  }

  DeleteData(int id) async{
    emit(LoadingState());
    var check = await DbHelper().DeleteData(id);
    if(check){
      var Note =await DbHelper().FetchData();
      emit(LoadedState(arrlist: Note));
    }
  }
}