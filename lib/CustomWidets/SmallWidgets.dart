import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SmallWidgets{


 static getToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static closeButton(context){
   return IconButton(onPressed: (){
     Navigator.pop(context);
   }, icon: Icon(Icons.close, color: Colors.black,));
  }
}