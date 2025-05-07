import 'package:flutter/material.dart';

class FimPage extends StatelessWidget {
  final String user;

  const FimPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sucesso'), automaticallyImplyLeading: false),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.settings.name == '/home');
          },
          child: const Text('Voltar para Home'),
        ),
      ),
    );
  }
}
