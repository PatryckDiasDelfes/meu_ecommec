import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/shared/app_colors.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/shared/widget/app_text_field.dart';


class SingupPage extends StatefulWidget {

  const SingupPage({ super.key });

  static String route = '/singup';

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  String email = '';
  String nome = '';
  String senha = '';

  bool lembreDeMim = false;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           
           body: Container(
            child: Column(
              children: [

                Column(
                  children: [
                    Text(
                      'Criar Uma conta',
                      style: AppTextStyle.subTitle,
                    ),
                    Text('Insira seus dados para iniciar suas compras')
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
                    ),
                    SizedBox(height: 15,),
                    AppTextField(
                      hintText: 'Nome',
                    ),
                    SizedBox(height: 15,),
                    AppTextField(
                      hintText: 'Senha',
                      obscureText: true,
                    ),
                    SizedBox(height: 15,),
                    AppTextField(
                      hintText: 'Confirme senha',
                      obscureText: true,
                    ),
                    ],
                  ),
                ),

                Spacer(flex: 2),

                Column(
                  children: [
                    Checkbox(
                          value: lembreDeMim,
                          onChanged: (value) {
                            setState(() {
                              lembreDeMim = value!;
                            });
                          }
                        ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      children: [
                        TextSpan(text: 'Ao clicar em continuar, você concorda com os nossos\n', style: TextStyle(color: AppColors.gray100)),
                        TextSpan(text: 'Termos de Serviço ', style: TextStyle(color: AppColors.black)),
                        TextSpan(text: 'e com a ', style: TextStyle(color: AppColors.gray100)),
                        TextSpan(text: 'Política de Privacidade', style: TextStyle(color: AppColors.black)),
                      ],
                      ),
                    ),
                    
                    SizedBox(height: 20,),
                    
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: AppElevatedButton(
                        label: 'Continuar', 
                        onPressed: () => {},
                        type:  ButtonType.filled, 
                        backgroundColor: AppColors.black
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

              ],
            ),
           ),
       );
  }
}