import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/cart/controller/cart_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';
import 'package:provider/provider.dart';

class AppModal extends StatelessWidget {
  const AppModal({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // =========================
              // Imagem
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: double.infinity,
                  height: 195,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // =========================
              // Nome
              // =========================
              Text(product.name, style: AppTextStyle.subTitle),

              const SizedBox(height: 3),

              // =========================
              // Marca
              // =========================
              Text(product.brand, style: AppTextStyle.smallBlack1),

              const SizedBox(height: 5),

              // =========================
              // Descrição
              // =========================
              Text(product.description, style: AppTextStyle.smallBlack1),

              const SizedBox(height: 8),

              // =========================
              // Preço
              // =========================
              Text(
                'R\$${product.price.toStringAsFixed(2)}',
                style: AppTextStyle.price,
              ),

              const SizedBox(height: 8),

              // =========================
              // Botão
              // =========================
              AppElevatedButton(
                label: 'Adicionar ao carrinho',
                isLoading: false,

                onPressed: () {
                  context.read<CartController>().addProduct(product);

                  Navigator.pop(context);
                },

                type: ButtonType.filled,
                backgroundColor: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
