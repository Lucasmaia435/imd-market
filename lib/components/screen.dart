import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.body, this.needsScrool = true});

  final Widget body;

  final bool needsScrool;
  @override
  Widget build(BuildContext context) {
    Widget _body = body;

    if (needsScrool) {
      _body = SingleChildScrollView(child: _body);
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.orange[900],
        title: const Text(
          "IMDMARKET",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _body,
    );
  }
}
