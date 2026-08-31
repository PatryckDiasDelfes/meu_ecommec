import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product_card.dart';

import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.category});

  final Category category;

  static String route = '/category';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Texto que o usuário está digitando
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final homeController = context.read<HomeController>();

    // Filtra os produtos:
    // 1. Pela categoria selecionada
    // 2. Pelo texto pesquisado
    final categoryProducts = homeController.products.where((product) {
      // Verifica se pertence à categoria atual
      final isSameCategory = product.category == widget.category.name;

      // Converte o nome do produto e a pesquisa para minúsculo
      final productName = product.name.toLowerCase();
      final search = searchText.toLowerCase();

      // Verifica se o nome contém o texto pesquisado
      final matchesSearch = productName.contains(search);

      // O produto precisa atender às duas condições
      return isSameCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),

      body: Column(
        children: [
          // =========================
          // BARRA DE PESQUISA
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

                border: const OutlineInputBorder(),
              ),
            ),
          ),

          // =========================
          // PRODUTOS
          // =========================
          Expanded(
            child: categoryProducts.isEmpty
                ? const Center(child: Text('Nenhum produto encontrado.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.64,
                        ),

                    itemCount: categoryProducts.length,

                    itemBuilder: (context, index) {
                      final product = categoryProducts[index];

                      return productCard(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
