import 'package:flutter/material.dart';

class UiHelper {

  static CustomTextFiled(TextEditingController controller,String text){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(text),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9)
          ),

        ),
      ),
    );
  }

}