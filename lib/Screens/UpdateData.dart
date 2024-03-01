import 'dart:developer';

import 'package:cubit_note_app/Cubit/NoteCubit.dart';
import 'package:cubit_note_app/Model/NoteModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/UiHelper.dart';

class UpdateData extends StatefulWidget {
  int id;

  UpdateData({super.key, required this.id});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController utitlecontroller = TextEditingController();
  TextEditingController udesccontroller = TextEditingController();
  UiHelper ui = UiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ui.CostumTextField(utitlecontroller, "Title"),
          ui.CostumTextField(udesccontroller, "Descritpion"),
          ElevatedButton(
              onPressed: () {
                String title = utitlecontroller.text;
                String description = udesccontroller.text;
                if(title ==""&&description==""){
                  log("enter rquired field");
                }
                else{
                  context.read<NoteCubit>().UpdateData(NoteModle(title: title, Description: description,id: widget.id));
                  Navigator.pop(context);
                }
              },
              child: Text("Update Data"))
        ],
      ),
    );
  }
}
