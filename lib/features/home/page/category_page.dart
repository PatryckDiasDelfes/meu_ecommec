import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';
import 'package:meu_1_ecommerc/shared/widget/app_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  String selectedOrder = 'Mais relevantes';

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
    // ORDENAÇÃO
    // ==================================================
    if (selectedOrder == 'Menor preço') {
      categoryProducts.sort((a, b) => a.price.compareTo(b.price));
    }

    if (selectedOrder == 'Maior preço') {
      categoryProducts.sort((a, b) => b.price.compareTo(a.price));
    }

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
          // FILTROS
          // ==================================================
          GestureDetector(
            onTap: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  double tempMinPrice = minPrice;
                  double tempMaxPrice = maxPrice;
                  String tempOrder = selectedOrder;

                  return StatefulBuilder(
                    builder: (context, setModalState) {
                      return SizedBox(
                        height: 600,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Filtros',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 24),

                              const Text(
                                'Ordenar por',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Wrap(
                                spacing: 8,
                                children: [
                                  FilterChip(
                                    label: const Text('Mais relevantes'),
                                    selected: tempOrder == 'Mais relevantes',
                                    onSelected: (_) {
                                      setModalState(() {
                                        tempOrder = 'Mais relevantes';
                                      });
                                    },
                                  ),

                                  FilterChip(
                                    label: const Text('Menor preço'),
                                    selected: tempOrder == 'Menor preço',
                                    onSelected: (_) {
                                      setModalState(() {
                                        tempOrder = 'Menor preço';
                                      });
                                    },
                                  ),

                                  FilterChip(
                                    label: const Text('Maior preço'),
                                    selected: tempOrder == 'Maior preço',
                                    onSelected: (_) {
                                      setModalState(() {
                                        tempOrder = 'Maior preço';
                                      });
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // ==================================================
                              // CATEGORIA
                              // ==================================================
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: categories.map((category) {
                                  return FilterChip(
                                    label: Text(category),
                                    selected: selectedCategory == category,
                                    onSelected: (selected) {
                                      setModalState(() {
                                        selectedCategory = selected
                                            ? category
                                            : 'Todas';
                                      });
                                    },
                                  );
                                }).toList(),
                              ),

                              const SizedBox(height: 20),

                              // ==================================================
                              // PREÇO
                              // ==================================================
                              const Text(
                                'Preço',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'R\$ ${tempMinPrice.toStringAsFixed(2)}',
                                  ),
                                  Text(
                                    'R\$ ${tempMaxPrice.toStringAsFixed(2)}',
                                  ),
                                ],
                              ),

                              RangeSlider(
                                min: lowestPrice,
                                max: highestPrice,
                                values: RangeValues(tempMinPrice, tempMaxPrice),
                                onChanged: (values) {
                                  setModalState(() {
                                    tempMinPrice = values.start;
                                    tempMaxPrice = values.end;
                                  });
                                },
                              ),

                              const Spacer(),

                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      minPrice = tempMinPrice;
                                      maxPrice = tempMaxPrice;
                                      selectedOrder = tempOrder;
                                    });

                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Aplicar filtros',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.filter_list),
                  SizedBox(width: 8),
                  Text('Filtros'),
                ],
              ),
            ),
          ),

          // ==================================================
          // PRODUTOS
          // ==================================================
          Expanded(
            child: categoryProducts.isEmpty
                ? const Center(child: Text('Nenhum produto encontrado.'))
                //O GridView.builder serve para criar vários itens automaticamente.
                : GridView.builder(
                    padding: const EdgeInsets.all(10),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.65,
                        ),

                    itemCount: categoryProducts.length,

                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: categoryProducts[index],
                        onTap: () {
                          final Product product = categoryProducts[index];

                          print('PRODUTO CLICADO: ${product.name}');

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return AppModal(
                                brand: product.brand,
                                name: product.name,
                                imageUrl: product.imageUrl,
                                description: product.description,
                                price: product.price,
                                category: product.category,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
