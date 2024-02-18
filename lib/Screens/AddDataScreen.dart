import 'package:cubit_note_app/Widget/UiHelper.dart';
import 'package:flutter/material.dart';

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
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Add Note"))
        ],
      ),
    );
  }
}
