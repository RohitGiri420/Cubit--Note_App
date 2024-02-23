import 'package:cubit_note_app/Cubit/NotesCubit.dart';
import 'package:cubit_note_app/Cubit/States.dart';
import 'package:cubit_note_app/Models/NoteModel.dart';
import 'package:cubit_note_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NoteState>(
      builder: (context, state) =>Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextFiled(titleController, "Title"),
            UiHelper.CustomTextFiled(descController, "Description"),
            ElevatedButton(onPressed: (){
              String title = titleController.text.toString();
              String desc = descController.text.toString();
              context.read<NotesCubit>().AddData(NoteModel(title: title, description: desc));
              Navigator.pop(context);
            }, child: Text("Add Note"))
          ],
        ),
      ),
    );
  }
}
