````md
# Filtragem de produtos

O método `.where()` percorre todos os produtos da lista
`homeController.products` e verifica cada produto individualmente.

## 1. Verificação da categoria

A variável `isSameCategory` verifica se a categoria do produto
é igual à categoria que está sendo visualizada.

```dart
final isSameCategory = product.category == widget.category.name;
````

Se forem iguais, o resultado será `true`.

## 2. Preparação do texto para pesquisa

O método `toLowerCase()` transforma o nome do produto e o texto
pesquisado em letras minúsculas.

```dart
final productName = product.name.toLowerCase();
final search = searchText.toLowerCase();
```

Isso evita diferenças entre letras maiúsculas e minúsculas.

Por exemplo:
Nike
nike
NIKE
NiKe

Todos serão tratados como:
nike


## 3. Verificação da pesquisa

O método `.contains()` verifica se o nome do produto contém
o texto digitado pelo usuário.

```dart
final matchesSearch = productName.contains(search);
```

Por exemplo:
```dart
'camiseta nike'.contains('nike')
```

Retorna:
true

Enquanto:

```dart
'camiseta nike'.contains('adidas')
```

Retorna:
false

A pesquisa também pode ser parcial:

```dart
'camiseta nike'.contains('cam')
```

Retorna:
true

## 4. Combinação das condições

No final, as duas condições são combinadas:

```dart
return isSameCategory && matchesSearch;
```

O operador `&&` significa **"E"**.

Portanto, o produto só será incluído no resultado quando:

* Pertencer à categoria atual;
* E o nome corresponder ao texto pesquisado.

### Exemplo

Categoria atual:
Roupas

Pesquisa:
nike


| Produto         | Categoria | Pesquisa          | Resultado   |
| --------------- | --------- | ----------------- | ----------- |
| Camiseta Nike   | Roupas    | Contém "nike"     | Aparece     |
| Tênis Nike      | Calçados  | Contém "nike"     | Não aparece |
| Camiseta Adidas | Roupas    | Não contém "nike" | Não aparece |

## 5. Conversão para lista

No final temos:

```dart
}).toList();
```

O `.where()` retorna um `Iterable`.

O `.toList()` transforma o resultado em uma lista.

Assim:

```dart
final categoryProducts = ...
```

passa a ser uma:
List<Product>

contendo somente os produtos que passaram pelo filtro.

## 6. Quando a pesquisa está vazia

Quando o usuário não digitou nada:

```dart
searchText = '';
```

A comparação passa a ser:

```dart
productName.contains('')
```

Isso retorna `true`.

Consequentemente, quando a pesquisa está vazia, todos os produtos
da categoria atual são exibidos.

## Resumo

O funcionamento completo pode ser entendido assim:


Todos os produtos
       ↓
Percorre cada produto com .where()
       ↓
Pertence à categoria atual?
       ↓
Corresponde à pesquisa?
       ↓
       ├── Sim → adiciona ao resultado
       └── Não → ignora
       ↓
.toList()
       ↓
Lista final de produtos

O filtro, portanto, realiza duas verificações:

Categoria correta
       +
Pesquisa correspondente
       =
Produto exibido
