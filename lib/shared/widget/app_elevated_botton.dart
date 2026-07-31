import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/app_text_style.dart';

class AppElevatedBotton extends StatelessWidget {
  const AppElevatedBotton({
    super.key, required this.buttonName, required this.backgroundColor, required this.foregroundColor, required this.borderColor,
  });

  final String buttonName;
  final Color backgroundColor;
  final Color foregroundColor;   
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton

    
      (onPressed:() => {}, 
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Text(buttonName),
    );
  }
}
