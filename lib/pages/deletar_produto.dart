import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';

class DeletarProduto extends StatelessWidget {
  const DeletarProduto({super.key});

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
                "DELETAR PRODUTO",
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
                    child: const Text("Deletar"),
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
