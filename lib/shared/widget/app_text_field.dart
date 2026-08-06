import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';

class AppTextField extends StatefulWidget  {
  const AppTextField({
    super.key,
    required this.hintText, 
    this.obscureText = false, 
    this.onChanged,
    
  });

  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  
   
  @override
  State<AppTextField> createState() => _AppTextFieldState();

}
  class _AppTextFieldState extends State<AppTextField> {
    late bool isObscure;

    @override
    initState() {
      isObscure = widget.obscureText;
      super.initState();
    }
    void toggleObscure() {
      setState(() {
        isObscure = !isObscure;
      });
    }

    Widget build(BuildContext context) {
      return TextField(
        onChanged: widget.onChanged,
        obscureText: isObscure,

        decoration: InputDecoration(
          suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  toggleObscure();
                },
                icon: isObscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
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
            //focusedBorder: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(14),
              //borderSide: BorderSide(color: AppColors.gray100),
            //),
          ), 
        ),
      );
    }
  }