import 'package:flutter/material.dart';
import 'home_page.dart';

class FourthRoute extends StatelessWidget {
  final String user;

  const FourthRoute({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FIM'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute(user: user)),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Voltar para Home'),
        ),
      ),
    );
  }
}
