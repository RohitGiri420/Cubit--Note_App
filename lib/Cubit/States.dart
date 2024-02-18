import '../Models/NoteModel.dart';

abstract class NoteState{}

class initialState extends NoteState{}
class LoadingState extends NoteState{}
class LoadedState extends NoteState{
  List<NoteModel>?arrlist =[];
  int? id;

  LoadedState({this.arrlist,this.id});
}
class errorState extends NoteState{
  String errorMessage;
  errorState({required this.errorMessage});
}
