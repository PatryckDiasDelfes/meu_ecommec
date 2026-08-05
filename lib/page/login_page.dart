import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/page/singup_page.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

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
              Column(
                children: [
                  Image.asset( 
                    //'assets/images/icon_market.png',
                    'assets/images/splash_screen.png',
                    width: MediaQuery.of(context).size.width * 0.4,


                  ),
                  Text('+DevsEcomm',  style: AppTextStyle.title,),
                ],
              ),
              Spacer(flex: 2),
              AppTextField(hintText: 'Email@dominio.com'),
              SizedBox(height: 10),
              AppTextField(hintText: '*********', isPassword: true,),
              TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerRight,
                ),
                onPressed: () => {}, 
                child: Text(
                  'Esqueci minha senha',
                  style: AppTextStyle.smallBlack,
                ),
              ),
              AppElevatedButton(
                label: 'Entrar', 
                onPressed: () => {},
                type: ButtonType.filled, 
                backgroundColor: AppColors.black, 
                ),
              SizedBox(height: 30),
              AppElevatedButton(
                label: 'Cadastre-se',
                onPressed: () => Navigator.pushNamed(context, SingupPage.route), 
                type: ButtonType.outlined, 
                backgroundColor: AppColors.white, 
              ),

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
                    TextSpan(text: 'Termo de serviço ', style: TextStyle(color: AppColors.black)),
                    TextSpan(text: 'e', style: TextStyle(color: AppColors.gray100)),
                    TextSpan(text: ' Politicas de privacidade', style: TextStyle(color: AppColors.black)),
                  ],
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
