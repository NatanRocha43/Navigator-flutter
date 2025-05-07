import 'package:flutter/material.dart';
import 'fim_page.dart';

class CadastroPage extends StatefulWidget {
  final String user;
  final void Function(List<String>) onSaveItems;

  const CadastroPage({
    required this.user,
    required this.onSaveItems,
    super.key,
  });

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _itemController = TextEditingController();
  final List<String> _itens = [];

  void _adicionarItem() {
    final texto = _itemController.text.trim();
    if (texto.isNotEmpty) {
      setState(() {
        _itens.add(texto);
        _itemController.clear();
      });
    }
  }

  void _salvar() {
    if (_itens.isNotEmpty) {
      widget.onSaveItems(_itens);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FimPage(user: widget.user),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Adicione pelo menos um item')),
      );
    }
  }

  void _removerItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Itens'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Campo para adicionar novos itens
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Novo item',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _adicionarItem(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add, size: 32),
                  onPressed: _adicionarItem,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Lista de itens adicionados
            Expanded(
              child: _itens.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum item adicionado',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _itens.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Text('${index + 1}'),
                            title: Text(_itens[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removerItem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            
            // Botão para salvar todos
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _salvar,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Todos os Itens'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}