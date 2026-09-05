import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/shared/widget/app_elevated_botton.dart';

class AppModal extends StatelessWidget {
  const AppModal({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.category,
  });
  final String brand;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String category;

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
                    child: Image.network(imageUrl, fit: BoxFit.fitWidth),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // =========================
              // Nome
              // =========================
              Text(name, style: AppTextStyle.subTitle),

              const SizedBox(height: 3),

              // =========================
              // Marca
              // =========================
              Text(brand, style: AppTextStyle.smallBlack1),

              const SizedBox(height: 5),

              // =========================
              // Descrição
              // =========================
              Text(description, style: AppTextStyle.smallBlack1),

              const SizedBox(height: 8),

              // =========================
              // Preço
              // =========================
              Text('R\$${price.toStringAsFixed(2)}', style: AppTextStyle.price),

              const SizedBox(height: 8),

              // =========================
              // Botão
              // =========================
              AppElevatedButton(
                label: 'Adcionar ao carrinho',

                isLoading: false,

                onPressed: () {},

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
