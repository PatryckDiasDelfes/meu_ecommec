import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/models/category_model.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';

import 'package:meu_1_ecommerc/shared/mocks.dart';

enum CategoriesViewState { loading, success, error }

enum ProductsViewState { loading, success, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];

  CategoriesViewState categoriesState = CategoriesViewState.loading;

  ProductsViewState productsState = ProductsViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;

    notifyListeners();
  }

  void changeProductsState(ProductsViewState state) {
    productsState = state;

    notifyListeners();
  }

  Future<void> getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);

    await Future.delayed(const Duration(seconds: 3));

    try {
      categories = categoriesJson.map((item) {
        return Category.fromJson(item);
      }).toList();

      changeCategoriesState(CategoriesViewState.success);
    } catch (e) {
      changeCategoriesState(CategoriesViewState.error);
    }
  }

  Future<void> getProducts() async {
    changeProductsState(ProductsViewState.loading);

    await Future.delayed(const Duration(seconds: 3));

    try {
      products = productsJson.map((item) {
        return Product.fromJson(item);
      }).toList();

      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
