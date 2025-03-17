import 'package:flutter/material.dart';

TextField textField({required var label,required String hintText,dynamic controller,Icon? icon}){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: icon,
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

SizedBox sizedBoxHeight({double? mHeight=11}){
  return SizedBox(
    height: mHeight);
}

SizedBox sizedBoxWidth({double? mWidth=11}){
  return SizedBox(
    width: mWidth,);
}