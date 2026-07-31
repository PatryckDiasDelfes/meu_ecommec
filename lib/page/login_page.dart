import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/app_colors.dart';
import 'package:meu_ecommec/shared/app_text_style.dart';
import 'package:meu_ecommec/shared/widget/app_elevated_botton.dart';
import 'package:meu_ecommec/shared/widget/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 2),
              Text('+DevsEcomm',  style: AppTextStyle.title,),
              Spacer(flex: 2),
              AppTextField(hintText: 'Email@dominio.com'),
              AppTextField(hintText: '*********'),
              TextButton(
                onPressed: () => {}, 
                child: Text('Esqueci minha senha'),
              ),
              AppElevatedBotton(buttonName: 'Entrar', backgroundColor: AppColors.black, foregroundColor: AppColors.white,),
              SizedBox(height: 30,),
              AppElevatedBotton(buttonName: 'Cadastra-se', backgroundColor: AppColors.white, foregroundColor: AppColors.black),

              Spacer(),
        //GestureDetector adciona metodos de interação
              GestureDetector(
                onTap: () => {
                  print("Cliquei na linha"),
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                  children: [
                    TextSpan(text: 'Termo de serviço', style: TextStyle(color: AppColors.black)),
                    TextSpan(text: 'e', style: TextStyle(color: AppColors.black)),
                    TextSpan(text: 'Politicas de privacidade', style: TextStyle(color: AppColors.black)),
                  ]
                )),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
