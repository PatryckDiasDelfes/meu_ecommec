import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/controller/login_controller.dart';
import 'package:meu_1_ecommerc/features/page/forgot_page.dart';
import 'package:meu_1_ecommerc/features/page/pg_tast.dart';
import 'package:meu_1_ecommerc/features/page/singup_page.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
import 'package:meu_1_ecommerc/shared/widget/app_checkBox.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();
  @override
  initState() {
    super.initState();
  }

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
                  Text('+DevsEcomm', style: AppTextStyle.title),
                ],
              ),
              Spacer(flex: 2),
              AppTextField(
                errorText: loginController.emailError,
                hintText: 'Email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    loginController.setEmail(value);
                  });
                },
              ),
              SizedBox(height: 10),
              AppTextField(
                errorSenha: loginController.senhaError,
                hintText: '******',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    loginController.setSenha(value);
                  });
                },
              ),
              Row(
                children: [
                  CustomCheckbox(
                    text: 'Lembre-se de mim',
                    value: loginController.isActiveCheckBox,
                    onChanged: (value) {
                      setState(() {
                        loginController.changeActiveCheckBox();
                      });
                    },
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(alignment: Alignment.centerRight),
                onPressed: () => Navigator.pushNamed(context, ForgotPage.route),
                child: Text(
                  'Esqueci minha senha',
                  style: AppTextStyle.smallBlack,
                ),
              ),
              AppElevatedButton(
                isLoading: true,
                label: 'Entrar',
                onPressed: loginController.isActiveButton
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
              AppElevatedButton(
                label: 'Teste',
                onPressed: () => Navigator.pushNamed(context, Testpagina.route),
                type: ButtonType.outlined,
                backgroundColor: AppColors.white,
              ),

              Spacer(),
              //GestureDetector adciona metodos de interação
              GestureDetector(
                onTap: () => {print("Cliquei na linha")},
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Termo de serviço ',
                        style: TextStyle(color: AppColors.black),
                      ),
                      TextSpan(
                        text: 'e',
                        style: TextStyle(color: AppColors.gray100),
                      ),
                      TextSpan(
                        text: ' Politicas de privacidade',
                        style: TextStyle(color: AppColors.black),
                      ),
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
