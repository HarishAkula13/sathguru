import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void ToastMessage (String msg){
  Toast.show(msg, duration: Toast.lengthShort, gravity:  Toast.bottom,backgroundColor:Colors.blue,webTexColor: Colors.white,
      backgroundRadius: 20);

}
validateEmail(String email) {
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}