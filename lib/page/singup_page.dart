import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/widget/app_elevated_botton.dart';
import 'package:meu_ecommec/shared/widget/app_text_field.dart';

class SingupPage extends StatelessWidget {

  const SingupPage({ super.key });

  static String route = '/singup';

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
                      'Criar Uma conta'),
                    Text('Insira seus dados para iniciar suas compras')
                  ],
                ),
                
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
                  isPassword: true,
                ),
                SizedBox(height: 15,),
                AppTextField(
                  hintText: 'Confirme senha',
                  isPassword: true,
                ),
              ],
            ),
           ),
       );
  }
}