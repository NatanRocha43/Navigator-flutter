import 'package:flutter/material.dart';
import 'fim_page.dart';

class ThirdRoute extends StatelessWidget {
  final String user;

  const ThirdRoute({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Salvar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FourthRoute(user: user)),
            );
          },
        ),
      ),
    );
  }
}
