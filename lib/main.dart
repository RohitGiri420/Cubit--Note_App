

import 'package:cubit_note_app/Cubit/NoteCubit.dart';
import 'package:cubit_note_app/DbHelper.dart';
import 'package:cubit_note_app/Screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(dbHelper: DbHelper()),
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ),
    );
  }
}