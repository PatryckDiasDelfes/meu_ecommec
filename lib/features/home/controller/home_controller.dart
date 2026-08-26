import 'dart:convert';

import 'package:flutter/material.dart';

enum CategoriesViewState { loading, success, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];

  CategoriesViewState categoriesState = CategoriesViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = [
        for (var element in categoriesJson) Category.fromJson(element),
      ];
      changeCategoriesState(CategoriesViewState.success);
    } catch (e) {
      changeCategoriesState(CategoriesViewState.error);
    }
  }
}

class Category {
  final String nome;
  final String imageUrl;

  Category({required this.nome, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(nome: json['nome'], imageUrl: json['imageUrl']);
  }
}

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];
