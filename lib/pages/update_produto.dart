import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/database/database_helper.dart';
import 'package:mobile/models/product.dart';

class UpdateProduto extends StatelessWidget {
  final Product product;

  const UpdateProduto({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController(text: product.code);
    final nameController = TextEditingController(text: product.name);
    final descriptionController =
        TextEditingController(text: product.description);
    final storageController =
        TextEditingController(text: product.storage.toString());

    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "ATUALIZAR PRODUTO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Código produto:"),
                TextField(controller: codeController, readOnly: true),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nome produto:"),
                TextField(controller: nameController),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Descrição do produto:"),
                TextField(controller: descriptionController),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Estoque produto:"),
                TextField(controller: storageController),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                        shape: const BeveledRectangleBorder()),
                    onPressed: () async {
                      final updatedProduct = Product(
                        code: codeController.text,
                        name: nameController.text,
                        description: descriptionController.text,
                        storage: int.parse(storageController.text),
                      );
                      try {
                        await DatabaseHelper().updateProduct(updatedProduct);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Produto atualizado com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erro ao atualizar produto: $e'),
                          ),
                        );
                      }
                    },
                    child: const Text("Atualizar"),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        shape: const BeveledRectangleBorder()),
                    onPressed: () {
                      codeController.clear();
                      nameController.clear();
                      descriptionController.clear();
                      storageController.clear();
                    },
                    child: const Text("Limpar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
