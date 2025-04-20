import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';

class CustomSnackBar{
  static dynamic customSnackBar(String content,BuildContext context){
    return  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content,style: TextStyle(color: AppColors
            .backgroundColor,fontFamily: AppFonts.primaryFont))
        ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          ,backgroundColor: AppColors.subtitleColor,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      ),
    );
  }
}