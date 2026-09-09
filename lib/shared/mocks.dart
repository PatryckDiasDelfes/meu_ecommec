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

final List<Map<String, dynamic>> productsJson = [
  // =========================
  // FRUTAS
  // =========================
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
    'category': 'Frutas',
    'description':
        'A acerola é uma fruta tropical de sabor marcante, levemente ácido e refrescante. É bastante apreciada pelo seu consumo in natura e também pode ser utilizada no preparo de sucos, vitaminas, geleias, sobremesas e outras receitas. Sua polpa apresenta uma textura suculenta e combina muito bem com outras frutas. Uma opção prática para quem busca adicionar uma fruta saborosa e versátil à alimentação do dia a dia.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Maçã',
    'imageUrl': 'https://i.postimg.cc/XYDwfZnN/download-(2).jpg',
    'price': 8.49,
    'category': 'Frutas',
    'description':
        'Fruta saborosa e crocante, ideal para consumir como lanche ou utilizar no preparo de receitas, saladas e sobremesas.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Banana',
    'imageUrl': 'https://i.postimg.cc/8znhRFT5/ole-ole.jpg',
    'price': 6.99,
    'category': 'Frutas',
    'description':
        'Fruta prática e nutritiva, com sabor naturalmente adocicado. Ideal para consumir pura, acompanhar refeições ou preparar vitaminas e sobremesas.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Morango',
    'imageUrl': 'https://i.postimg.cc/XYDwfZnN/download-(2).jpg',
    'price': 14.99,
    'category': 'Frutas',
    'description':
        'Fruta de sabor doce e levemente ácido, ideal para consumir fresca, preparar sobremesas, vitaminas, geleias e outras receitas.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Uva',
    'imageUrl': 'https://i.postimg.cc/8znhRFT5/ole-ole.jpg',
    'price': 11.49,
    'category': 'Frutas',
    'description':
        'Fruta suculenta e naturalmente adocicada, ótima para consumir fresca ou utilizar em saladas de frutas, sobremesas e sucos.',
  },
  {
    'brand': 'Akatsu',
    'name': 'Laranja',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.49,
    'category': 'Frutas',
    'description':
        'Fruta cítrica, suculenta e refrescante, muito utilizada no consumo in natura e no preparo de sucos e sobremesas.',
  },

  // =========================
  // VERDURAS
  // =========================
  {
    'brand': 'Natural da Terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 10.99,
    'category': 'Verduras',
    'description':
        'O rabanete é um vegetal de sabor característico, levemente picante, com textura firme e crocante. Pode ser consumido cru em saladas, utilizado como acompanhamento ou incorporado a diferentes preparações. Sua aparência e sabor marcantes ajudam a trazer variedade aos pratos, sendo uma opção interessante para combinar com folhas, legumes e outros ingredientes frescos.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 12.19,
    'category': 'Verduras',
    'description':
        'Ingrediente versátil para o preparo de massas, risotos, molhos e diversos pratos. Possui textura macia e sabor característico.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Alface',
    'imageUrl': 'https://i.postimg.cc/rwYS1dq8/download-(1).jpg',
    'price': 5.49,
    'category': 'Verduras',
    'description':
        'Folhas frescas e leves, ideais para o preparo de saladas, sanduíches e acompanhamentos para suas refeições.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Couve',
    'imageUrl': 'https://i.postimg.cc/rwYS1dq8/download-(1).jpg',
    'price': 6.99,
    'category': 'Verduras',
    'description':
        'Folhas verdes e frescas, ideais para saladas, refogados, sopas e diversos acompanhamentos.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Espinafre',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 8.49,
    'category': 'Verduras',
    'description':
        'Folhas delicadas e saborosas que podem ser utilizadas em saladas, refogados, massas, tortas e outras preparações.',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Agrião',
    'imageUrl': 'https://i.postimg.cc/rwYS1dq8/download-(1).jpg',
    'price': 7.29,
    'category': 'Verduras',
    'description':
        'Folhas frescas de sabor característico, excelentes para saladas e acompanhamentos de refeições.',
  },

  // =========================
  // PADARIA
  // =========================
  {
    'brand': 'Padaria do Bairro',
    'name': 'Pão Francês',
    'imageUrl': 'https://i.postimg.cc/wjBXR5Y1/salted-bun.jpg',
    'price': 9.99,
    'category': 'Padaria',
    'description':
        'O pão francês é um dos itens mais tradicionais das padarias brasileiras. Possui uma casca dourada e crocante por fora, enquanto seu interior é macio e leve. É uma opção bastante versátil para o café da manhã ou lanche, podendo ser consumido puro, com manteiga, frios, queijos ou utilizado no preparo de sanduíches. Seu sabor simples combina facilmente com diferentes acompanhamentos.',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Pão de Forma',
    'imageUrl': 'https://i.postimg.cc/fRgxc3MR/download.jpg',
    'price': 12.49,
    'category': 'Padaria',
    'description':
        'Pão macio e prático para o dia a dia, ideal para preparar sanduíches, torradas e diversas outras receitas.',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Croissant',
    'imageUrl': 'https://i.postimg.cc/GmSkFBbL/download-(3).jpg',
    'price': 8.99,
    'category': 'Padaria',
    'description':
        'Massa folhada, leve e saborosa, perfeita para o café da manhã ou lanche. Pode ser consumida pura ou acompanhada de recheios.',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Pão de Leite',
    'imageUrl': 'https://i.postimg.cc/fRgxc3MR/download.jpg',
    'price': 10.49,
    'category': 'Padaria',
    'description':
        'Pão macio e levemente adocicado, ideal para o café da manhã, lanches e preparo de sanduíches.',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Sonho',
    'imageUrl': 'https://i.postimg.cc/GmSkFBbL/download-(3).jpg',
    'price': 7.99,
    'category': 'Padaria',
    'description':
        'Doce tradicional de padaria, com massa macia e recheio cremoso. Uma opção clássica para acompanhar o café.',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Baguete',
    'imageUrl': 'https://i.postimg.cc/wjBXR5Y1/salted-bun.jpg',
    'price': 11.99,
    'category': 'Padaria',
    'description':
        'Pão de formato alongado, com casca crocante e interior macio. Excelente para acompanhar refeições ou preparar sanduíches.',
  },

  // =========================
  // IMPORTADOS
  // =========================
  {
    'brand': 'Ferrero',
    'name': 'Nutella',
    'imageUrl':
        'https://i.postimg.cc/wjxVc8LT/pushmemes-nutella-(kawaii)-(1).jpg',
    'price': 29.99,
    'category': 'Importados',
    'description':
        'Nutella é um creme de avelã com cacau conhecido mundialmente por sua textura cremosa e sabor característico. Pode ser utilizado de diversas maneiras, seja espalhado sobre pães e torradas, acompanhado de frutas, utilizado no preparo de sobremesas ou simplesmente consumido como um complemento para diferentes lanches. Sua consistência facilita a aplicação e permite diversas combinações na cozinha.',
  },
  {
    'brand': 'Lindt',
    'name': 'Chocolate Lindt',
    'imageUrl':
        'https://i.postimg.cc/6p1dr7BQ/Lindt-Chocolate-Summer-S-mores-Contest-Baker-by-Nature.jpg',
    'price': 24.99,
    'category': 'Importados',
    'description':
        'Chocolate premium produzido pela Lindt, reconhecido pela qualidade e textura suave. Uma excelente opção para apreciar ou presentear.',
  },
  {
    'brand': 'Pringles',
    'name': 'Batata Pringles',
    'imageUrl': 'https://i.postimg.cc/HkPQwJTn/Pringles.jpg',
    'price': 18.99,
    'category': 'Importados',
    'description':
        'Batatas crocantes e saborosas, acondicionadas em sua tradicional embalagem tubular. Ideal para lanches e momentos de descontração.',
  },
  {
    'brand': 'Ferrero',
    'name': 'Kinder Bueno',
    'imageUrl':
        'https://i.postimg.cc/wjxVc8LT/pushmemes-nutella-(kawaii)-(1).jpg',
    'price': 16.99,
    'category': 'Importados',
    'description':
        'Chocolate recheado com creme de avelã e cobertura delicada. Uma opção prática para um lanche ou sobremesa.',
  },
  {
    'brand': 'Lindt',
    'name': 'Lindt Lindor',
    'imageUrl':
        'https://i.postimg.cc/6p1dr7BQ/Lindt-Chocolate-Summer-S-mores-Contest-Baker-by-Nature.jpg',
    'price': 32.99,
    'category': 'Importados',
    'description':
        'Chocolate com recheio cremoso e textura suave, ideal para apreciar sozinho ou compartilhar em momentos especiais.',
  },
  {
    'brand': 'Pringles',
    'name': 'Pringles Original',
    'imageUrl': 'https://i.postimg.cc/HkPQwJTn/Pringles.jpg',
    'price': 21.49,
    'category': 'Importados',
    'description':
        'Batata crocante com sabor tradicional, perfeita para lanches, reuniões e momentos de descontração.',
  },
];

//Agora são 24 produtos no total: 6 Frutas, 6 Verduras, 6 Padaria e 6 Importados.
