import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {

  final String text;

  const CustomCheckbox({
    super.key,
    required this.text,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Checkbox(
          value: value,

          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          }
        ),

        Text(widget.text),

      ],
    );
  }
}