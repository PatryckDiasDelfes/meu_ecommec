# `didChangeDependencies()`

## Código

```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  if (minPrice != null && maxPrice != null) {
    return;
  }

  final homeController = context.read<HomeController>();

  if (homeController.products.isEmpty) {
    return;
  }

  final prices = homeController.products
      .map((product) => product.price)
      .toList();

  minPrice = prices.reduce((a, b) => a < b ? a : b);

  maxPrice = prices.reduce((a, b) => a > b ? a : b);
}
```

---

## 1. O que é `didChangeDependencies()`?

`didChangeDependencies()` é um método do ciclo de vida de um `StatefulWidget`.

Ele é chamado pelo Flutter:

* depois de `initState()`;
* quando alguma dependência do widget muda;
* quando o widget depende de algo fornecido pelo `BuildContext`.

Exemplo:

```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  // código
}
```

No nosso caso, ele é útil porque estamos utilizando:

```dart
context.read<HomeController>();
```

O `HomeController` é uma dependência disponibilizada pelo `Provider`.

---

# 2. Por que não colocar isso no `initState()`?

Uma dúvida comum seria:

```dart
@override
void initState() {
  super.initState();

  final homeController = context.read<HomeController>();
}
```

Embora `context.read()` possa ser usado em determinadas situações no `initState`, o `didChangeDependencies()` é mais apropriado quando queremos trabalhar com dependências do `BuildContext` que podem mudar.

Nosso código depende dos produtos fornecidos pelo:

```dart
HomeController
```

Por isso usamos:

```dart
didChangeDependencies()
```

---

# 3. Chamando o método pai

```dart
super.didChangeDependencies();
```

Essa linha chama a implementação original do Flutter.

É importante manter essa chamada quando sobrescrevemos um método do ciclo de vida.

A estrutura padrão é:

```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  // nosso código
}
```

---

# 4. Verificando se os preços já foram inicializados

```dart
if (minPrice != null && maxPrice != null) {
  return;
}
```

Aqui estamos evitando executar o cálculo novamente.

Os estados são:

```dart
double? minPrice;
double? maxPrice;
```

O `?` significa que eles podem ser `null`.

Inicialmente:

```text
minPrice = null
maxPrice = null
```

Então a condição:

```dart
minPrice != null && maxPrice != null
```

é falsa.

O código continua.

Depois que os valores forem calculados:

```text
minPrice = 19.90
maxPrice = 499.90
```

A condição passa a ser verdadeira.

Então:

```dart
return;
```

encerra o método.

Isso evita recalcular os preços desnecessariamente.

---

# 5. Obtendo o `HomeController`

```dart
final homeController = context.read<HomeController>();
```

Aqui estamos utilizando o Provider para obter o `HomeController`.

O:

```dart
context.read<HomeController>()
```

significa basicamente:

> "Pegue o `HomeController` disponível neste contexto, mas não fique observando mudanças nele."

Isso é diferente de:

```dart
context.watch<HomeController>()
```

`watch` observa alterações e pode reconstruir o widget.

`read` apenas acessa o objeto.

Neste método, queremos apenas acessar os produtos para fazer o cálculo inicial.

---

# 6. Verificando se existem produtos

```dart
if (homeController.products.isEmpty) {
  return;
}
```

Antes de calcular o menor e o maior preço, precisamos garantir que existe pelo menos um produto.

Imagine:

```dart
homeController.products = [];
```

Nesse caso:

```dart
prices.reduce(...)
```

causaria um erro.

Por isso verificamos primeiro:

```dart
if (homeController.products.isEmpty) {
  return;
}
```

Se não existem produtos, simplesmente saímos do método.

---

# 7. Obtendo os preços

```dart
final prices = homeController.products
    .map((product) => product.price)
    .toList();
```

Aqui transformamos:

```text
Lista de produtos
```

em:

```text
Lista de preços
```

Imagine que os produtos sejam:

```text
Produto A → R$ 50
Produto B → R$ 120
Produto C → R$ 80
Produto D → R$ 200
```

Depois do:

```dart
.map((product) => product.price)
```

teremos:

```text
[50, 120, 80, 200]
```

O:

```dart
.toList()
```

transforma o resultado em uma lista concreta.

Então:

```dart
prices
```

será:

```dart
List<double>
```

---

# 8. Encontrando o menor preço

```dart
minPrice = prices.reduce((a, b) => a < b ? a : b);
```

O `reduce()` percorre a lista comparando os valores.

Para:

```text
[50, 120, 80, 200]
```

ele faz comparações equivalentes a:

```text
50 < 120 → 50
50 < 80  → 50
50 < 200 → 50
```

Resultado:

```dart
minPrice = 50;
```

Ou seja:

```text
minPrice = menor preço disponível
```

---

# 9. Encontrando o maior preço

```dart
maxPrice = prices.reduce((a, b) => a > b ? a : b);
```

O funcionamento é semelhante, mas agora procuramos o maior valor.

Para:

```text
[50, 120, 80, 200]
```

o resultado será:

```dart
maxPrice = 200;
```

Ou seja:

```text
maxPrice = maior preço disponível
```

---

# 10. Por que fazemos isso?

Nosso `RangeSlider` precisa conhecer seus limites:

```dart
RangeSlider(
  min: lowestPrice,
  max: highestPrice,
  values: RangeValues(
    minPrice!,
    maxPrice!,
  ),
)
```

Queremos que esses limites sejam baseados nos produtos reais.

Por exemplo, se nossa loja possui:

```text
R$ 29,90
R$ 49,90
R$ 79,90
R$ 129,90
R$ 199,90
```

o slider começa aproximadamente em:

```text
R$ 29,90 ───────────────── R$ 199,90
```

em vez de usar valores arbitrários como:

```text
R$ 0 ───────────────────── R$ 1000
```

---

# 11. Fluxo completo

O funcionamento é:

```text
CategoryPage inicia
        ↓
didChangeDependencies()
        ↓
minPrice e maxPrice já existem?
        ↓
     NÃO
        ↓
obtém HomeController
        ↓
existem produtos?
        ↓
     SIM
        ↓
extrai os preços
        ↓
encontra menor preço
        ↓
encontra maior preço
        ↓
salva nos estados
        ↓
RangeSlider utiliza esses valores
```

---

# 12. Exemplo prático

Suponha que:

```dart
homeController.products
```

tenha:

```text
Camiseta     R$ 50
Calça        R$ 120
Tênis        R$ 300
Boné         R$ 40
```

Depois deste código:

```dart
final prices = homeController.products
    .map((product) => product.price)
    .toList();
```

teremos:

```dart
prices = [50, 120, 300, 40];
```

Depois:

```dart
minPrice = prices.reduce((a, b) => a < b ? a : b);
```

teremos:

```text
minPrice = 40
```

E:

```dart
maxPrice = prices.reduce((a, b) => a > b ? a : b);
```

teremos:

```text
maxPrice = 300
```

Portanto:

```text
RangeSlider

R$ 40 ───────────────────── R$ 300
```

---

# 13. Por que `minPrice` e `maxPrice` são `double?`

Declaramos:

```dart
double? minPrice;
double? maxPrice;
```

porque inicialmente ainda não sabemos os valores.

Antes da inicialização:

```text
minPrice = null
maxPrice = null
```

Depois:

```text
minPrice = 40
maxPrice = 300
```

Isso permite representar dois estados diferentes:

```text
null
↓
ainda não calculado
```

e:

```text
40 / 300
↓
já calculado
```

Essa distinção é importante para evitar que o `RangeSlider` seja criado com valores inválidos.

---

# 14. Resumindo

O método:

```dart
didChangeDependencies()
```

está sendo usado para inicializar os limites do filtro de preço com base nos produtos existentes no `HomeController`.

Ele:

1. garante que o método pai seja executado;
2. evita recalcular os valores se eles já existem;
3. acessa o `HomeController`;
4. verifica se existem produtos;
5. extrai os preços;
6. encontra o menor preço;
7. encontra o maior preço;
8. salva esses valores em `minPrice` e `maxPrice`.

O resultado final é que o filtro de preço se adapta automaticamente aos produtos disponíveis, sem precisar definir manualmente valores como `0` e `1000`.

```

Se quiser, depois podemos criar uma documentação semelhante para **todo o sistema de filtros da `CategoryPage`**, mantendo um `.md` por conceito.
```
