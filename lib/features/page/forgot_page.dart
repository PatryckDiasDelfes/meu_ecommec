import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';

class ForgotPage extends StatefulWidget {
  static String route = '/ForgotPage';

  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),

      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Recuperar senha', style: AppTextStyle.title),

            const SizedBox(height: 50),

            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.90,
              child: AppTextField(hintText: 'Email@dominio.com'),
            ),

            Spacer(),

            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.90,
              child: AppElevatedButton(
                label: 'Continuar',
                onPressed: () {
                  AnimatedSnackBar.material(
                    'Apertei',
                    type: AnimatedSnackBarType.success,
                  ).show(context);
                },
                type: ButtonType.filled,
                backgroundColor: AppColors.black,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
