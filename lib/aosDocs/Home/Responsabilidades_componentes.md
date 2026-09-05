# Responsabilidades dos componentes

## Produtos

### `ProductCard`

Responsável pela representação visual e interação de **um único produto**.

* Exibir a imagem do produto
* Exibir a marca
* Exibir o nome
* Exibir o preço
* Detectar o clique no produto
* Ativar o `Skeletonizer` durante o carregamento

---

### `ProductCarousel`

Responsável por **listar os produtos em formato de carrossel**.

* Utilizar o `CarouselSlider`
* Obter os produtos através do `HomeController`
* Percorrer a lista de produtos
* Criar um `ProductCard` para cada produto
* Passar os dados do produto para o `ProductCard`
* Repassar o callback `onProductTap`
* Informar ao `ProductCard` quando o carregamento está acontecendo

---

### `ProductSection`

Responsável pela **estrutura da seção de produtos dentro da Home**.

* Verificar o estado de carregamento dos produtos
* Exibir o estado de erro
* Exibir o título da seção `"Produtos"`
* Exibir o `ProductCarousel`
* Controlar qual conteúdo deve ser apresentado de acordo com o estado dos produtos

A `ProductSection` adiciona uma camada de responsabilidade que não pertence diretamente ao carrossel ou ao card: **a organização da seção dentro da página**.

---

## Categorias

### `CategoryCard`

Responsável pela representação visual e interação de **uma única categoria**.

* Exibir a imagem da categoria
* Exibir o nome da categoria
* Detectar o clique na categoria
* Ativar o `Skeletonizer` durante o carregamento

---

### `CategoryCarousel`

Responsável por **listar as categorias em formato de carrossel**.

* Utilizar o `CarouselSlider`
* Obter as categorias através do `HomeController`
* Percorrer a lista de categorias
* Criar um `CategoryCard` para cada categoria
* Passar os dados da categoria para o `CategoryCard`
* Verificar o estado de carregamento
* Criar os elementos de `Skeleton` durante o carregamento
* Realizar a navegação para a página da categoria ao clicar

---

## Diferença estrutural

Os produtos possuem uma camada adicional:

ProductSection
      ↓
ProductCarousel
      ↓
ProductCard

Essa separação existe porque `ProductSection` possui responsabilidades próprias relacionadas à **seção da Home**, como título, loading e tratamento de erro.

As categorias atualmente possuem apenas:

CategoryCarousel
      ↓
CategoryCard

Nesse caso, o `CategoryCarousel` concentra tanto as responsabilidades do carrossel quanto o tratamento de loading e a navegação.

### Regra geral

Cada componente deve ter uma responsabilidade clara:

Card
↓
Responsável por representar um item.

Carousel
↓
Responsável por listar vários itens.

Section
↓
Responsável por organizar uma seção da página e controlar
o que deve ser exibido nessa seção.
