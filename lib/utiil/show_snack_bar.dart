import 'package:flutter/material.dart';
import 'package:note_app/utiil/size_config.dart';
class ShowSnackBar{
 static void showSnackBar(BuildContext context,{required String text,bool? selected}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: selected==true?Colors.green:Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Text(text,textAlign: TextAlign.center,style: TextStyle(
          fontSize: SizeConfig.scaleTextFont(20),
        ),),
      ),
    );
  }
}

