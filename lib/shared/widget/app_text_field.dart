import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.controller,
  });

  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

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
    return TextFormField(
      //Controla a forma de como o campo é validado.
      autovalidateMode: AutovalidateMode.onUnfocus,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      validator: widget.validator,

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
          borderSide: BorderSide(color: AppColors.gray100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.gray100),
          //focusedBorder: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(14),
          //borderSide: BorderSide(color: AppColors.gray100),
          //),
        ),
      ),
    );
  }
}
