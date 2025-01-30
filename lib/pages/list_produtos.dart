import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/database/database_helper.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/pages/update_produto.dart';

class ListProdutos extends StatelessWidget {
  const ListProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      needsScrool: false,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "LISTA DE PRODUTO",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: DatabaseHelper().getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar produtos'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhum produto encontrado'));
                } else {
                  final products = snapshot.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdateProduto(
                              product: product,
                            ),
                          ),
                        ),
                        title: Text(product.name),
                        subtitle: Text(
                            'Código: ${product.code}, Estoque: ${product.storage}'),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
