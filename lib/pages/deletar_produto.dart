import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/database/database_helper.dart';

class DeletarProduto extends StatelessWidget {
  const DeletarProduto({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "DELETAR PRODUTO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Código do produto:"),
                TextField(controller: codeController),
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
                      final code = codeController.text;
                      try {
                        await DatabaseHelper().deleteProduct(code);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Produto deletado com sucesso!')),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Erro ao deletar produto: $e')),
                        );
                      }
                    },
                    child: const Text("Deletar"),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        shape: const BeveledRectangleBorder()),
                    onPressed: () {
                      codeController.clear();
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
