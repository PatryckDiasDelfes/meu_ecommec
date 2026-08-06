import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/page/singup_page.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
import 'package:meu_1_ecommerc/shared/widget/checkBox.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool lembreDeMim = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;

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
              AppTextField(
                hintText: 'Email@dominio.com',
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                }
              ),
              SizedBox(height: 10),
              AppTextField(
                hintText: '*********', 
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    senha = value;
                  });
                }
              ),
              Row(
                children: [
                  CustomCheckbox(text: 'Lembre-se de mim')
                ],
              ),
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
                onPressed: isActiveButton
                    ? () => {print('cliquei em entrar')}
                    : null,
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
