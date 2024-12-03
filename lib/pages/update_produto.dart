import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';

class UpdateProduto extends StatelessWidget {
  const UpdateProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "LISTA DE PRODUTO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Código produto:"),
                TextField(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome produto:"),
                TextField(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descrição do produto:"),
                TextField(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Estoque produto:"),
                TextField(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Alterar"),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const BeveledRectangleBorder(),
                    ),
                    onPressed: () {},
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
