import 'dart:developer';

import 'package:cubit_note_app/Cubit/NoteCubit.dart';
import 'package:cubit_note_app/Cubit/NoteState.dart';
import 'package:cubit_note_app/Model/NoteModel.dart';
import 'package:cubit_note_app/Screens/AddData.dart';
import 'package:cubit_note_app/Screens/UpdateData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<NoteModle> arrlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<NoteCubit>().GetData();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.ErrorMsg));
          } else if (state is LoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      context.read<NoteCubit>().DeleteData(state.arrlist[index].id!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  title: Text(state.arrlist[index].title),
                  subtitle: Text(state.arrlist[index].Description),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData(id: state.arrlist[index].id!),));
                    },
                    icon: Icon(Icons.edit),
                  ),
                );
              },
              itemCount: state.arrlist.length,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddData(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
