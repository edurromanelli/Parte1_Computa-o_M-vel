import 'package:flutter/material.dart';
import 'core/data/produtos.dart';
import 'core/models/produto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos - Parte 3',
      home: const ProdutosPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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