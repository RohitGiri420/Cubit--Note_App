import 'package:cubit_note_app/Model/NoteModel.dart';

abstract class NoteState{}

class InitialState extends NoteState{}

class LoadingState extends NoteState{}

class LoadedState extends NoteState{
  List<NoteModle> arrlist =[];
  int id;

  LoadedState({required this.arrlist,required this.id});
}

class ErrorState extends NoteState{
  String ErrorMsg;
  ErrorState({required this.ErrorMsg});
}