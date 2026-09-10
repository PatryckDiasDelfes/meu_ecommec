import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Carrinho')),

      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          final products = homeController.products;

          return SingleChildScrollView(
            child: Column(
              children: [
                // =========================
                // Espaçamento externo
                // =========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  child: Container(
                    // =========================
                    // Dimensões
                    // =========================
                    width: double.infinity,
                    height: 126,

                    // =========================
                    // Decoração
                    // =========================
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    // =========================
                    // Conteúdo
                    // =========================
                    child: Row(
                      children: [
                        // =========================
                        // Imagem
                        // =========================
                        SizedBox(child: Image.network(products.first.imageUrl)),

                        // =========================
                        // Conteúdo da direita
                        // =========================
                        Expanded(
                          child: Column(
                            children: [
                              // =========================
                              // Linha superior
                              // =========================
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(products.first.name),
                                      Text(products.first.brand),
                                    ],
                                  ),
                                  Text('R\$ ${products.first.price}'),
                                ],
                              ),

                              // =========================
                              // Linha inferior
                              // =========================
                              Row(
                                children: [
                                  AppElevatedButton(
                                    label: '-',
                                    type: ButtonType.filled,
                                    backgroundColor: AppColors.black,
                                  ),

                                  Text('Opa'),
                                  AppElevatedButton(
                                    label: '+',
                                    type: ButtonType.filled,
                                    backgroundColor: AppColors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
