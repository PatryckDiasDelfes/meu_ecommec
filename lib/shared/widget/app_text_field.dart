import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';

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
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  void toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      validator: widget.validator,

      // Só mostra a validação automaticamente
      // depois que showError for true.
      // autovalidateMode: widget.showError
      //     ? AutovalidateMode.always
      //     : AutovalidateMode.disabled,
      autovalidateMode: AutovalidateMode.onUnfocus,
      decoration: InputDecoration(
        hintText: widget.hintText,

        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: toggleObscure,
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.gray100),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.gray100),
        ),
      ),
    );
  }
}
