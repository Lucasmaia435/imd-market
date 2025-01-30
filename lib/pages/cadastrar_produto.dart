import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/database/database_helper.dart';
import 'package:mobile/models/product.dart';

class CadastrarProduto extends StatelessWidget {
  const CadastrarProduto({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final storageController = TextEditingController();

    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "CADASTRAR PRODUTO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Código produto:"),
                TextField(controller: codeController),
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
                      final product = Product(
                        code: codeController.text,
                        name: nameController.text,
                        description: descriptionController.text,
                        storage: int.parse(storageController.text),
                      );
                      try {
                        await DatabaseHelper().insertProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Produto cadastrado com sucesso!')),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Erro ao cadastrar produto: $e')),
                        );
                      }
                    },
                    child: const Text("Salvar"),
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
