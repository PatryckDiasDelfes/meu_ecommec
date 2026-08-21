import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/singup/controller/singup_controller.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';
import 'package:meu_1_ecommerc/shared/widget/app_checkBox.dart';
import 'package:meu_1_ecommerc/shared/widget/verify_data.dart';
import 'package:provider/provider.dart';

class SingupPage extends StatelessWidget {
  SingupPage({super.key});

  static String route = '/singup';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: const Text('')),

      body: SafeArea(
        child: Consumer<SingUpController>(
          builder:
              (
                BuildContext context,
                SingUpController controller,
                Widget? child,
              ) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: 20,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        // =========================
                        // TÍTULO
                        // =========================
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

                        // =========================
                        // CAMPOS
                        // =========================
                        Column(
                          children: [
                            // E-MAIL
                            AppTextField(
                              controller: controller.emailController,
                              validator: controller.validateEmail,

                              hintText: 'Email@dominio.com',
                            ),

                            const SizedBox(height: 15),

                            // NOME
                            AppTextField(
                              hintText: 'Nome',
                              controller: controller.nomeController,
                              validator: controller.validateName,
                            ),

                            const SizedBox(height: 15),

                            // SENHA
                            AppTextField(
                              controller: controller.senhaController,
                              validator: controller.validateSenha,

                              hintText: 'Senha',
                              obscureText: true,

                              onChanged: (value) {
                                controller.setSenha(value);
                              },
                            ),

                            const SizedBox(height: 15),

                            // CONFIRMAR SENHA
                            AppTextField(
                              validator: controller.validateConfirmarSenha,

                              hintText: 'Confirme senha',
                              obscureText: true,

                              onChanged: (value) {
                                controller.setConfirmarSenha(value);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // =========================
                        // VALIDAÇÕES DA SENHA
                        // =========================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AVISO SOBRE EXIGENCIA DE SENHA
                            VerifyData(
                              label: 'Mínimo de 6 caracteres',

                              isValid: controller.validator.minChars(
                                controller.senha,
                              ),
                            ),

                            // AVISO SOBRE EXIGENCIA DE SENHA
                            VerifyData(
                              label: 'No mínimo um caractere especial',

                              isValid: controller.validator.specialChar(
                                controller.senha,
                              ),
                            ),

                            // AVISO SOBRE EXIGENCIA DE SENHA
                            VerifyData(
                              label: 'No mínimo uma letra maiúscula',

                              isValid: controller.validator.upperCase(
                                controller.senha,
                              ),
                            ),

                            // AVISO SOBRE EXIGENCIA DE SENHA
                            VerifyData(
                              label: 'No mínimo uma letra minúscula',

                              isValid: controller.validator.lowerCase(
                                controller.senha,
                              ),
                            ),

                            // AVISO SOBRE EXIGENCIA DE SENHA
                            VerifyData(
                              label: 'As senhas coincidem',

                              isValid: controller.validator.passwordMatch(
                                controller.senha,
                                controller.confirmarSenha,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // =========================
                        // TERMOS
                        // =========================
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

                        // =========================
                        // CHECKBOX
                        // =========================
                        CustomCheckbox(
                          text: 'Aceito',

                          showError: controller.checkBoxError,

                          value: controller.isActiveCheckBox,

                          onChanged: (value) {
                            controller.changeActiveCheckBox();
                          },
                        ),

                        const SizedBox(height: 20),

                        // =========================
                        // BOTÃO
                        // =========================
                        SizedBox(
                          width: double.infinity,

                          child: AppElevatedButton(
                            label: 'Continuar',

                            isLoading: controller.isLoading,

                            onPressed: !controller.isLoading
                                ? controller.handleSingUp
                                : null,

                            type: ButtonType.filled,

                            backgroundColor: AppColors.black,
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
        ),
      ),
    );
  }
}
