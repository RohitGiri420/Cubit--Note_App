import 'package:cubit_note_app/Cubit/NoteState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../DbHelper.dart';

class NoteCubit extends Cubit<NoteState>{
  DbHelper dbHelper;
  NoteCubit({required  this.dbHelper}):super(InitialState());

}