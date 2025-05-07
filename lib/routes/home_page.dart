import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'login_page.dart';

class SecondRoute extends StatelessWidget {
  final String user;

  const SecondRoute({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $user'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const FirstRoute()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Cadastrar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdRoute(user: user)),
            );
          },
        ),
      ),
    );
  }
}
