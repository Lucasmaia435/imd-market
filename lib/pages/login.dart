import 'package:flutter/material.dart';
import 'package:mobile/components/screen.dart';
import 'package:mobile/pages/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text(
              "Login:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Login",
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Senha:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Senha",
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(32),
                shape: const BeveledRectangleBorder(),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Home(),
                  ),
                );
              },
              child: const Text("ENTRAR"),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Esqueci minha senha/login",
                style: TextStyle(color: Colors.blue[900]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
