import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/cart/model/cart_item_model.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';

class CartController extends ChangeNotifier {
  // =========================
  // PRODUTOS DO CARRINHO
  // =========================

  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  // =========================
  // ADICIONAR PRODUTO
  // =========================

  void addProduct(Product product) {
    final index = _items.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(product: product));
    }

    notifyListeners();
  }

  // =========================
  // AUMENTAR QUANTIDADE
  // =========================

  void increaseQuantity(Product product) {
    final index = _items.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index != -1) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // =========================
  // DIMINUIR QUANTIDADE
  // =========================

  void decreaseQuantity(Product product) {
    final index = _items.indexWhere(
      (item) => item.product.name == product.name,
    );

    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }

      notifyListeners();
    }
  }

  // =========================
  // REMOVER PRODUTO
  // =========================

  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);

    notifyListeners();
  }

  // =========================
  // TOTAL DO CARRINHO
  // =========================

  double get total {
    double total = 0;

    for (final item in _items) {
      total += item.product.price * item.quantity;
    }

    return total;
  }
}
