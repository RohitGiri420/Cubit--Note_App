import 'package:flutter/material.dart';

class UiHelper{

  CostumTextField(TextEditingController controller,String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(text),
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}









