import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/controller/singup_controller.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
import 'package:meu_1_ecommerc/shared/widget/app_checkBox.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  static String route = '/singup';

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  SingUpController singUpController = SingUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),

      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                Column(
                  children: [
                    Text('Criar Uma conta', style: AppTextStyle.subTitle),
                    Text('Insira seus dados para iniciar suas compras'),
                  ],
                ),

                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                  child: Column(
                    children: [
                      AppTextField(
                        hintText: 'Email@dominio.com',
                        onChanged: (value) {
                          setState(() {
                            singUpController.setEmail(value);
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      AppTextField(
                        hintText: 'Nome',
                        onChanged: (value) {
                          setState(() {
                            singUpController.setNome(value);
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      AppTextField(
                        hintText: 'Senha',
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            singUpController.setSenha(value);
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      AppTextField(
                        hintText: 'Confirme senha',
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            singUpController.setConfirmarSenha(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 280),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ao clicar em continuar, você concorda com os nossos\n',
                            style: TextStyle(color: AppColors.gray100),
                          ),
                          TextSpan(
                            text: 'Termos de Serviço ',
                            style: TextStyle(color: AppColors.black),
                          ),
                          TextSpan(
                            text: 'e com a ',
                            style: TextStyle(color: AppColors.gray100),
                          ),
                          TextSpan(
                            text: 'Política de Privacidade',
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),

                    CustomCheckbox(
                      text: 'Aceito',
                      value: singUpController.isActiveCheckBox,
                      onChanged: (value) {
                        setState(() {
                          singUpController.changeActiveCheckBox();
                        });
                      },
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: AppElevatedButton(
                        label: 'Continuar',
                        onPressed: singUpController.isActiveButton
                            ? () => {print('cliquei em entrar')}
                            : null,
                        type: ButtonType.filled,
                        backgroundColor: AppColors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
