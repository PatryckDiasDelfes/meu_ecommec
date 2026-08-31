import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category});

  final Category category;

  static String route = '/category';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // =========================
  // Controllers
  // =========================
  final TextEditingController searchController = TextEditingController();

  // =========================
  // Estados
  // =========================
  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();

    // =========================
    // Filtragem dos produtos
    // =========================
    final categoryProducts = homeController.products.where((product) {
      final isSameCategory = product.category == widget.category.name;

      final productName = product.name.toLowerCase();
      final search = searchText.toLowerCase();

      final matchesSearch = productName.contains(search);

      return isSameCategory && matchesSearch;
    }).toList();

    return Scaffold(
      // =========================
      // App bar
      // =========================
      appBar: AppBar(title: Text(widget.category.name)),

      // =========================
      // Conteúdo
      // =========================
      body: Column(
        children: [
          // =========================
          // Barra de pesquisa
          // =========================
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,

              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },

              decoration: InputDecoration(
                hintText: 'Pesquisar produto...',
                prefixIcon: const Icon(Icons.search),

                // Botão para limpar a pesquisa
                suffixIcon: searchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();

                          setState(() {
                            searchText = '';
                          });
                        },
                      )
                    : null,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
              ),
            ),
          ),

          // =========================
          // Produtos
          // =========================
          Expanded(
            child: categoryProducts.isEmpty
                ? const Center(child: Text('Nenhum produto encontrado.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),

                    // =========================
                    // Configuração da grade
                    // =========================
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.64,
                        ),

                    itemCount: categoryProducts.length,

                    // =========================
                    // Card do produto
                    // =========================
                    itemBuilder: (context, index) {
                      final product = categoryProducts[index];

                      return ProductCard(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
