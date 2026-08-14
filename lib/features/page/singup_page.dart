import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/controller/singup_controller.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
import 'package:meu_1_ecommerc/shared/widget/app_checkBox.dart';
import 'package:meu_1_ecommerc/shared/widget/verify_data.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  static String route = '/singup';

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final SingUpController singUpController = SingUpController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    // SafeArea evita que o conteúdo fique atrás da barra de status ou notch,
    // SingleChildScrollView permite rolar a página quando o conteúdo não couber,
    // screenWidth armazena a largura da tela para criar espaçamentos responsivos,
    // padding cria margens laterais e verticais no conteúdo,
    // double.infinity faz o botão ocupar toda a largura disponível,
    // SizedBox controla os espaçamentos entre os componentes,
    // textAlign centraliza os textos.

    return Scaffold(
      appBar: AppBar(title: const Text('')),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: 20,
          ),
          child: Column(
            children: [
              // TÍTULO
              Column(
                children: [
                  Text(
                    'Criar Uma conta',
                    style: AppTextStyle.subTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Insira seus dados para iniciar suas compras',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // CAMPOS
              Column(
                children: [
                  AppTextField(
                    hintText: 'Email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        singUpController.setEmail(value);
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  AppTextField(
                    hintText: 'Nome',
                    onChanged: (value) {
                      setState(() {
                        singUpController.setNome(value);
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  AppTextField(
                    hintText: 'Senha',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        singUpController.setSenha(value);
                      });
                    },
                  ),

                  const SizedBox(height: 15),

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

              const SizedBox(height: 20),

              // VALIDAÇÕES
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerifyData(
                    label: 'Mínimo de 6 caracteres',
                    isValid: singUpController.validator.minChars(
                      singUpController.senha,
                    ),
                  ),

                  VerifyData(
                    label: 'No mínimo um caractere especial',
                    isValid: singUpController.validator.specialChar(
                      singUpController.senha,
                    ),
                  ),

                  VerifyData(
                    label: 'No mínimo uma letra maiúscula',
                    isValid: singUpController.validator.upperCase(
                      singUpController.senha,
                    ),
                  ),

                  VerifyData(
                    label: 'No mínimo uma letra minúscula',
                    isValid: singUpController.validator.lowerCase(
                      singUpController.senha,
                    ),
                  ),

                  VerifyData(
                    label: 'As senhas coincidem',
                    isValid: singUpController.validator.passwordMatch(
                      singUpController.senha,
                      singUpController.confirmarSenha,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // TERMOS
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

              const SizedBox(height: 10),

              // CHECKBOX
              CustomCheckbox(
                text: 'Aceito',
                value: singUpController.isActiveCheckBox,
                onChanged: (value) {
                  setState(() {
                    singUpController.changeActiveCheckBox();
                  });
                },
              ),

              const SizedBox(height: 20),

              // BOTÃO
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  label: 'Continuar',
                  onPressed: singUpController.isActiveButton
                      ? () {
                          print('cliquei em entrar');
                        }
                      : null,
                  type: ButtonType.filled,
                  backgroundColor: AppColors.black,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
