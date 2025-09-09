// main.dart
// Trabalho - Programação Móvel
// Simulação de gerenciamento de dados no console

class Produto {
  final int id;
  final String nome;
  final double preco;

  // construtor com parâmetros nomeados
  Produto({required this.id, required this.nome, required this.preco});
}

//   if (kDebugMode) {
//     print("=== Lista de Produtos ===");
//   }

//   // Percorrendo a lista com laço
//   for (var produto in produtos) {
//     // Condicional: preço maior que 500 recebe destaque
//     if (produto.preco > 500) {
//       print(
//           "[DESTAQUE] Produto caro encontrado: ${produto.nome} - R\$ ${produto.preco}");
//     } else {
//       print("${produto.nome} - R\$ ${produto.preco}");
//     }
//   }
// }
