import 'package:meu_1_ecommerc/features/home/models/product_model.dart';

class CartItemModel {
  CartItemModel({required this.product, this.quantity = 1});

  final Product product;

  int quantity;
}
