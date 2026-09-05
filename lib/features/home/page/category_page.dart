import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product/product_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, this.category});

  final Category? category;

  static String route = '/category';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // ==================================================
  // CONTROLLERS
  // ==================================================

  final TextEditingController searchController = TextEditingController();

  // ==================================================
  // ESTADOS
  // ==================================================

  double minPrice = 0;
  double maxPrice = 0;
  String? selectedCategory;
  String searchText = '';

  // ==================================================
  // CICLO DE VIDA
  // ==================================================

  @override
  void initState() {
    super.initState();

    selectedCategory = widget.category?.name ?? 'Todas';
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  // ==================================================
  // BUILD
  // ==================================================

  @override
  Widget build(BuildContext context) {
    // ==================================================
    // CONTROLLER
    // ==================================================

    final homeController = context.watch<HomeController>();

    // ==================================================
    // PREÇOS
    // ==================================================

    final prices = homeController.products
        .map((product) => product.price)
        .toList();

    final lowestPrice = prices.isEmpty
        ? 0.0
        : prices.reduce((a, b) => a < b ? a : b);

    final highestPrice = prices.isEmpty
        ? 1000.0
        : prices.reduce((a, b) => a > b ? a : b);

    if (minPrice == 0 && maxPrice == 0 && prices.isNotEmpty) {
      minPrice = lowestPrice;
      maxPrice = highestPrice;
    }

    // ==================================================
    // CATEGORIAS
    // ==================================================

    final categories = [
      'Todas',
      ...homeController.products
          .map((product) => product.category)
          .toSet()
          .toList(),
    ];

    // ==================================================
    // FILTRAGEM
    // ==================================================
    // Ver documentação: docs/home/filtragem.md

    final categoryProducts = homeController.products.where((product) {
      final isSameCategory =
          selectedCategory == 'Todas' || product.category == selectedCategory;

      final productName = product.name.toLowerCase();
      final search = searchText.toLowerCase();
      final matchesSearch = productName.contains(search);

      final matchesPrice =
          product.price >= minPrice && product.price <= maxPrice;

      return isSameCategory && matchesSearch && matchesPrice;
    }).toList();

    // ==================================================
    // TELA
    // ==================================================

    return Scaffold(
      // ==================================================
      // APP BAR
      // ==================================================
      appBar: AppBar(
        title: Text(selectedCategory ?? 'Todos os produtos'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),

      // ==================================================
      // CONTEÚDO
      // ==================================================
      body: Column(
        children: [
          // ==================================================
          // PESQUISA
          // ==================================================
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

          // ==================================================
          // CATEGORIA
          // ==================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Categoria',
                border: OutlineInputBorder(),
              ),
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
          ),

          // ==================================================
          // PREÇO
          // ==================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Preço',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'R\$ ${minPrice.toStringAsFixed(2)} - '
                      'R\$ ${maxPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                RangeSlider(
                  min: lowestPrice,
                  max: highestPrice,
                  values: RangeValues(minPrice, maxPrice),
                  onChanged: (values) {
                    setState(() {
                      minPrice = values.start;
                      maxPrice = values.end;
                    });
                  },
                ),
              ],
            ),
          ),

          // ==================================================
          // PRODUTOS
          // ==================================================
          Expanded(
            child: categoryProducts.isEmpty
                ? const Center(child: Text('Nenhum produto encontrado.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),

                    // ==================================================
                    // CONFIGURAÇÃO DA GRADE
                    // ==================================================
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.64,
                        ),

                    itemCount: categoryProducts.length,

                    // ==================================================
                    // CARD DO PRODUTO
                    // ==================================================
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
