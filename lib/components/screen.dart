import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.orange[900],
        title: const Text(
          "IMDMARKET",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: body,
    );
  }
}
