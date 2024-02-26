import 'package:cubit_note_app/Models/NoteModel.dart';
import 'package:cubit_note_app/Widget/UiHelper.dart';
import 'package:cubit_note_app/provider/noteProvider.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextFiled(titleController, "Title"),
          UiHelper.CustomTextFiled(descController, "Description"),
          ElevatedButton(onPressed: () {
            String title = titleController.text.toString();
            String desc = descController.text.toString();
            context.read<NoteProvider>().addData(NoteModel(title: title, description: desc));
            Navigator.pop(context);
          }, child: Text("Add Note"))
        ],
      ),
    );
  }
}
