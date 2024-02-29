import 'package:cubit_note_app/widget/UiHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  UiHelper ui = UiHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ui.CostumTextField(titlecontroller, "Title"),
          ui.CostumTextField(desccontroller, "Descritpion"),
          ElevatedButton(onPressed: (){
          //Code here............................................................
            Navigator.pop(context);
          }, child: Text("Add Data"))

        ],
      ),
    );
  }
}
