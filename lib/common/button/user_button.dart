
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../text/label_text.dart';



Widget UserButton(Function() onClick,String title,BuildContext context){
  return GestureDetector(
    onTap: (){
      onClick();
    },
    child: Container(
      height: MediaQuery.of(context).size.height*0.055,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
         color: HexColor('#337ab7')


      ),
      child:ItemLabelText(text:title,style: TextStyle(fontSize: 20,color: Colors.white,),),
    ),
  );
}