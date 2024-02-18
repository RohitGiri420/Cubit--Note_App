import 'package:cubit_note_app/Cubit/States.dart';
import 'package:cubit_note_app/DataBase/DbHelper.dart';
import 'package:cubit_note_app/Models/NoteModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NoteState>{
    DbHelper dbHelper;
    NotesCubit({required this.dbHelper}):super(initialState());
    
    addData(NoteModel noteModel)async{
      emit(LoadingState());
      bool check = await dbHelper.addData(noteModel);
      if(check){
        var data = await dbHelper.FetchData();
        emit(LoadedState(arrlist: data));
      }
      else{
        emit(errorState(errorMessage: "getting error while adding data"));
      }

    }

    getData() async{
      emit(LoadingState());
      var data = await dbHelper.FetchData();
      emit(LoadedState(arrlist: data));
    }
}