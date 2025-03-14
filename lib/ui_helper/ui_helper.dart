import 'package:flutter/material.dart';

TextField textField({required var label,required var name,dynamic controller,Icon? icon}){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: icon,
      border: OutlineInputBorder(),
      labelText: label,
      hintText: name,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
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