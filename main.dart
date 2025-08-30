// main.dart
// Trabalho - Programação Móvel
// Simulação de gerenciamento de dados no console

class Produto {
  int id;
  String nome;
  double preco;

  Produto(this.id, this.nome, this.preco);
}

void main() {
  // Criando lista de produtos
  List<Produto> produtos = [
    Produto(1, "Mouse Gamer", 120.0),
    Produto(2, "Teclado Mecânico", 300.0),
    Produto(3, "Cadeira Escritório", 900.0),
    Produto(4, "Pen Drive 32GB", 45.0),
    Produto(5, "Monitor 24''", 850.0),
  ];

  print("=== Lista de Produtos ===");

  // Percorrendo a lista com laço
  for (var produto in produtos) {
    // Condicional: preço maior que 500 recebe destaque
    if (produto.preco > 500) {
      print(
          "⚡ [DESTAQUE] Produto caro encontrado: ${produto.nome} - R\$ ${produto.preco}");
    } else {
      print("${produto.nome} - R\$ ${produto.preco}");
    }
  }
}
