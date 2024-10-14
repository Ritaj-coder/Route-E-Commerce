import 'package:flutter/material.dart';
import 'package:route/app_colors.dart';

class UserData extends StatelessWidget {
 String labelText ;
 TextEditingController controller;
 TextInputType keyboardtype;
 bool obscureText;
 String? Function(String?) validator;
 UserData({required this.labelText , required this.controller ,
 required this.validator , this.keyboardtype = TextInputType.text,
 this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText:  labelText ,labelStyle: TextStyle(
        color: AppColors.whitecolor ,
      ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.whitecolor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.whitecolor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.red)),
      ),
      controller: controller,
      keyboardType: keyboardtype,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
