import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintText,});

  final String hintText; 

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        //suffixIcon: Icon(Icons.visibility),
        //fillColor: AppColors.black,
        //filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.gray100,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.gray100,
          ),
        ), 
      ),
    );
  }
}