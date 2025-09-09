# Projeto de Computação Móvel – Avaliação Processual  

Este repositório contém a evolução do projeto desenvolvido nas **Partes 1, 2 e 3** da disciplina de **Computação Móvel**.  

O objetivo foi compreender a linguagem Dart, evoluir para Flutter e aplicar conceitos de **UI**, **StatefulWidget** e **gerenciamento de estado**.  

---

## 📌 Parte 1 – Lógica em Dart (Console)  
Na primeira parte, implementamos um código em **Dart puro (console)** que define:  
- Uma **classe `Produto`** contendo atributos `id`, `nome` e `preco`.  
- Uma **lista de produtos** (5 itens cadastrados manualmente).  
- Impressão dessa lista no terminal.  

➡ O código da Parte 1 foi mantido no diretório `parte1_console/` para preservar a implementação original.  

---

## 📌 Parte 2 – Interface Gráfica em Flutter  
Na segunda parte, migramos o código para um aplicativo Flutter:  
- Criamos a estrutura do Flutter (`MaterialApp`, `Scaffold`, `AppBar`).  
- Movemos a **classe `Produto`** para `lib/core/models/produto.dart`.  
- Movemos a **lista de produtos** para `lib/core/data/produtos.dart`.  
- A tela principal (`ProdutosPage`) utilizava um **StatelessWidget** para exibir a lista.  
- Os produtos foram renderizados com **ListView.builder** e exibidos em `ListTile`.  

➡ O app mostrava os dados da Parte 1 em uma interface **estática**, mas funcional.  

---

## 📌 Parte 3 – Interatividade e Gerenciamento de Estado  
Na terceira parte, o foco foi **interatividade** e **gerenciamento de estado** com **StatefulWidget**.  

### 🔹 Alterações principais
1. **Conversão para StatefulWidget**  
   - A tela principal (`ProdutosPage`) deixou de ser `StatelessWidget` e passou a ser um `StatefulWidget`.  
   - Agora a lista de produtos (`_produtos`) faz parte do estado interno da tela.  

2. **Gerenciamento de Estado com setState()**  
   - Criamos a função `_adicionarProduto()`.  
   - Ao clicar no botão, um novo produto é adicionado à lista usando `setState()`.  
   - Isso força a UI a ser redesenhada automaticamente.  

3. **Botão Interativo**  
   - Incluímos um **FloatingActionButton (FAB)** com ícone de “+”.  
   - O FAB chama `_adicionarProduto()` quando clicado.  

4. **Refinamento Visual**  
   - Cada item da lista é exibido em um **Card** com `ListTile`.  
   - O `leading` usa `CircleAvatar` para mostrar o ID.  
   - O `title` mostra o nome e o `subtitle` o preço formatado.  

---

## 🧩 Estrutura de Código (Parte 3)
Trecho principal da tela:

```dart
class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final List<Produto> _produtos = List.from(produtos);

  void _adicionarProduto() {
    setState(() {
      final novoId = _produtos.length + 1;
      _produtos.add(
        Produto(id: novoId, nome: "Novo Produto $novoId", preco: 99.0 + novoId),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Produtos')),
      body: ListView.builder(
        itemCount: _produtos.length,
        itemBuilder: (context, index) {
          final p = _produtos[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: CircleAvatar(child: Text(p.id.toString())),
              title: Text(p.nome),
              subtitle: Text("Preço: R\$ ${p.preco.toStringAsFixed(2)}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
