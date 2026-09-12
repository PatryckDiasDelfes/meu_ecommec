import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/cart/controller/cart_controller.dart';
import 'package:meu_1_ecommerc/features/cart/widget/cart_product_card.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
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
      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(title: const Text('Meu Carrinho')),

      // =========================
      // CONTEÚDO
      // =========================
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          final items = cartController.items;

          // =========================
          // CARRINHO VAZIO
          // =========================
          if (items.isEmpty) {
            return const Center(child: Text('Seu carrinho está vazio.'));
          }

          // =========================
          // LISTA + RODAPÉ
          // =========================
          return Column(
            children: [
              // =========================
              // LISTA DE PRODUTOS
              // =========================
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return CartProductCard(item: item);
                  },
                ),
              ),

              // =========================
              // RODAPÉ
              // =========================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.black)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // =========================
                    // TOTAL
                    // =========================
                    Text(
                      'Total: R\$ ${cartController.total.toStringAsFixed(2)}',
                      style: AppTextStyle.headingMedium,
                    ),

                    // =========================
                    // COMPRAR
                    // =========================
                    AppElevatedButton(
                      label: 'Comprar',
                      type: ButtonType.filled,
                      backgroundColor: AppColors.black,
                      onPressed: () {
                        // Ação de comprar
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
