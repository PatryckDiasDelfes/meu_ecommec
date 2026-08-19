# meu_ecommec

A new Flutter module project.

## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/to/add-to-app).


## 🧠 Cola rápida — Operadores Dart

**Operador ternário `? :`**  = If/Else
**Operador ternário `!`**    = Não
**Operador ternário `&&`**   = E
**Operador ternário `??`**   = Se for `null`
**Operador ternário `?`**    = Pode ser `null`

| Operador |    Significado  | Exemplo                       |
|----------|-----------------|---------                      |
|   `? :`  | Se / Senão      | `condicao ? valor1 : valor2`  |
|   `!`    | Não / Inverte   | `!isLoading`                  |
|   `&&`   | E               | `idade >= 18 && temIngresso`  |
|   `||`   | Ou              | `temIngresso || éConvidado`   |
|   `??`   | Se for `null`,  | `nome ?? 'Usuário'`                              |
|          | usa outro valor | `nome ?? 'Usuário'`           |
|   `?`    | Pode ser `null` | `String? nome`                |

### Exemplos

**Operador ternário `? :`**

```dart
isLoading
    ? CircularProgressIndicator()
    : Text('Entrar');

Eu colocaria isso em uma seção tipo **"📚 Anotações de estudo"** ou **"🧠 Dart — conceitos básicos"**.

E tem uma vantagem interessante: conforme você for aprendendo Flutter, pode ir acrescentando outras colas no mesmo README, como `setState`, `async/await`, `Future`, `final`, `const`, `late`, `List`, `Map`, `getter`, etc. Isso acaba virando uma **documentação pessoal de consulta rápida** do seu aprendizado.
