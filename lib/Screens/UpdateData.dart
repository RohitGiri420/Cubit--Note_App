import 'package:flutter/material.dart';
import '../widget/UiHelper.dart';

class UpdateData extends StatefulWidget {
  int id;
  UpdateData({super.key,required this.id});

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
          ElevatedButton(onPressed: (){
            //code here.........................................................
            Navigator.pop(context);
            }, child: Text("Update Data"))
        ],
      ),
    );
  }
}
