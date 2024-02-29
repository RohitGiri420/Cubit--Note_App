import 'dart:developer';
import 'package:cubit_note_app/Screens/AddData.dart';
import 'package:cubit_note_app/Screens/UpdateData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body:ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              trailing: IconButton(onPressed: (){

              },
              icon: Icon(Icons.delete),),
              title: Text(""),
              subtitle: Text(""),
              leading: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData(id: 2),));
              }, icon: Icon(Icons.edit),),
            );
          },
            itemCount: 2,),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(),));
      },
      child: Icon(Icons.add),),
    );
  }
}