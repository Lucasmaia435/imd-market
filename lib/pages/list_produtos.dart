import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/models/product.dart';

class ListProdutos extends StatelessWidget {
  const ListProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = List.generate(
      10,
      (i) => Product(
        code: i,
        name: "Item $i",
        description: "Sub item $i",
        storage: i,
      ),
    );

    return Screen(
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
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
              ),
              itemCount: products.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(
                    products[i].name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    products[i].description,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: const BeveledRectangleBorder(),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Voltar",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
