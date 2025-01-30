import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/pages/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Usuário",
                hintText: "Usuário",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Senha",
                hintText: "Senha",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(32),
                shape: const BeveledRectangleBorder(),
              ),
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                if (username == 'admin' && password == 'admin') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login ou senha incorretos')),
                  );
                }
              },
              child: const Text("ENTRAR"),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                // Ação para o botão de esqueci a senha
              },
              child: const Text("Esqueci a senha"),
            ),
          ],
        ),
      ),
    );
  }
}
