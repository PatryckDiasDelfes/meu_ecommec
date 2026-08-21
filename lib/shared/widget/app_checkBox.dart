import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
    required this.showError,
  });

  final String text;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          side: BorderSide(color: showError ? Colors.red : Colors.black),
        ),

        Text(text),
      ],
    );
  }
}
