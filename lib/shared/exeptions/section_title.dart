import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppTextStyle.headingMedium),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 15,
            child: Icon(Icons.chevron_right, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
