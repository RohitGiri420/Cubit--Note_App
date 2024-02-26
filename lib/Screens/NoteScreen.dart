import 'dart:developer';

import 'package:cubit_note_app/Screens/AddDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/NoteModel.dart';
import '../Widget/UiHelper.dart';
import '../provider/noteProvider.dart';


class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController updatedtitleController = TextEditingController();
  TextEditingController updateddescController = TextEditingController();

  UiHelper ui = UiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BODY....................................................................
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<NoteProvider>(
          builder: (_, value, __) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  var curntNotes = value.getNotes()[index];
                  return Card(
                    child: ListTile(
                      leading:Text(index.toString()),
                      title: Text("${curntNotes.title}"),
                      subtitle: Text("${curntNotes.description}"),
                    ),
                  );
                },
              itemCount: value.getNotes().length,

            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNote(),
              ));
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}