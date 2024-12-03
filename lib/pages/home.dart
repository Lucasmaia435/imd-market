import 'package:flutter/material.dart';
import 'package:mobile/pages/cadastrar_produto.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/pages/deletar_produto.dart';
import 'package:mobile/pages/list_produtos.dart';
import 'package:mobile/pages/update_produto.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text(
              "O que deseja fazer?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.all(32),
                    fixedSize: const Size(130, 90),
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CadastrarProduto(),
                    ),
                  ),
                  child: const Text(
                    "Cadastrar\nproduto",
                    textAlign: TextAlign.center,
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(130, 90),
                    padding: const EdgeInsets.all(32),
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ListProdutos(),
                    ),
                  ),
                  child: const Text(
                    "Listar\nprodutos",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(130, 90),
                    padding: const EdgeInsets.all(32),
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UpdateProduto(),
                    ),
                  ),
                  child: const Text(
                    "Atualizar\nproduto",
                    textAlign: TextAlign.center,
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(130, 90),
                    padding: const EdgeInsets.all(32),
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DeletarProduto(),
                    ),
                  ),
                  child: const Text(
                    "Deletar\nprodutos",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.store_outlined,
              size: 256,
            )
          ],
        ),
      ),
    );
  }
}
