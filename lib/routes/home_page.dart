import 'package:flutter/material.dart';
import 'cadastro_page.dart';

class HomePage extends StatefulWidget {
  final String user;

  const HomePage({required this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = [];

  void _addItems(List<String> newItems) {
    setState(() {
      items.addAll(newItems);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newItems.length} itens adicionados!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, ${widget.user}'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Sair',
        ),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Nenhum item cadastrado\nClique no + para adicionar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key('$index-${items[index]}'),
                background: Container(color: Colors.red),
                onDismissed: (_) => _removeItem(index),
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: ListTile(
                    title: Text(items[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeItem(index),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CadastroPage(
                user: widget.user,
                onSaveItems: _addItems,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar itens',
      ),
    );
  }
}