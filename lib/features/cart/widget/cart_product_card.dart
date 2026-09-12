import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/cart/controller/cart_controller.dart';
import 'package:meu_1_ecommerc/features/cart/model/cart_item_model.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

      child: Container(
        // =========================
        // Dimensões
        // =========================
        width: double.infinity,
        height: 135,

        // =========================
        // Espaçamento interno
        // =========================
        padding: const EdgeInsets.all(10),

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
            SizedBox(
              width: 90,
              height: 90,
              child: Image.network(item.product.imageUrl, fit: BoxFit.contain),
            ),

            const SizedBox(width: 10),

            // =========================
            // Conteúdo da direita
            // =========================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    // =========================
                    // Linha superior
                    // =========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        // =========================
                        // Nome e marca
                        // =========================
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                item.product.name,
                                style: AppTextStyle.headingMedium,
                                overflow: TextOverflow.ellipsis,
                              ),

                              Text(
                                item.product.brand,
                                style: AppTextStyle.smallBlack1,
                              ),
                            ],
                          ),
                        ),

                        // =========================
                        // Preço
                        // =========================
                        Text(
                          'R\$ ${(item.product.price * item.quantity).toStringAsFixed(2)}',
                          style: AppTextStyle.headingMedium,
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // =========================
                    // Quantidade
                    // =========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        // =========================
                        // Diminuir
                        // =========================
                        AppElevatedButton(
                          label: '-',
                          isStyle: AppTextStyle.headingLarge,
                          type: ButtonType.addToCart,
                          backgroundColor: AppColors.black,

                          onPressed: () {
                            context.read<CartController>().decreaseQuantity(
                              item.product,
                            );
                          },
                        ),

                        const SizedBox(width: 10),

                        // =========================
                        // Quantidade
                        // =========================
                        Text(
                          '${item.quantity}',
                          style: AppTextStyle.headingMedium,
                        ),

                        const SizedBox(width: 10),

                        // =========================
                        // Aumentar
                        // =========================
                        AppElevatedButton(
                          label: '+',
                          isStyle: AppTextStyle.headingSmall,
                          type: ButtonType.addToCart,
                          backgroundColor: AppColors.black,

                          onPressed: () {
                            context.read<CartController>().increaseQuantity(
                              item.product,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
