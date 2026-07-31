import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/app_colors.dart';

class AppTextField extends StatefulWidget  {
  const AppTextField({super.key, required this.hintText, this.isPassword = false,});

  final String hintText;
  final bool isPassword;
   
  @override
  State<AppTextField> createState() => _AppTextFieldState();

}
  class _AppTextFieldState extends State<AppTextField> {


    bool obscureText = true;

    @override
    Widget build(BuildContext context) {
      return TextField(

        obscureText: widget.isPassword ? obscureText : false,

        

        decoration: InputDecoration(
          
          suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),

                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,


          hintText: widget.hintText,
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