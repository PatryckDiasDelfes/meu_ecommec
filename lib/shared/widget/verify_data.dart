import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';

class VerifyData extends StatelessWidget {
  const VerifyData({super.key, required this.label, required this.isValid});

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.check,
          color: isValid ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyle.smallBlack),
      ],
    );
  }
}
