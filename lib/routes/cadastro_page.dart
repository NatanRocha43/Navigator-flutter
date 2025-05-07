import 'package:flutter/material.dart';
import 'fim_page.dart';

class CadastroPage extends StatefulWidget {
  final String user;
  final void Function(String) onAddItem;

  const CadastroPage({required this.user, required this.onAddItem, super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _controller = TextEditingController();

  void _salvar() {
    final texto = _controller.text;
    if (texto.isNotEmpty) {
      widget.onAddItem(texto);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FimPage(user: widget.user),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro'), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome do item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvar,
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
