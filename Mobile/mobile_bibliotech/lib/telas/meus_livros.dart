import 'package:flutter/material.dart';
import '../dados.dart';

class MeusLivrosPage extends StatefulWidget {
  const MeusLivrosPage({super.key});

  @override
  State<MeusLivrosPage> createState() => _MeusLivrosPageState();
}

class _MeusLivrosPageState extends State<MeusLivrosPage> {
  @override
  Widget build(BuildContext context) {
    final livros = DadosApp.meusLivros;

    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Meus Livros'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      drawer: _menu(context),
      body: livros.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não possui livros emprestados.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: livros.length,
              itemBuilder: (context, index) {
                final livro = livros[index];

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF880024),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'EMPRESTADO',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '📖 ${livro['livro']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Data do empréstimo: ${livro['dataEmprestimo']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Data de devolução: ${livro['dataDevolucao']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Status: 🔴 Emprestado',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _menu(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF120005),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF3C0315),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Biblioteca Virtual 📚',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _itemMenu(context, Icons.home, 'Início', '/home'),
          _itemMenu(context, Icons.menu_book, 'Catálogo', '/catalogo'),
          _itemMenu(context, Icons.book, 'Meus Livros', '/meus-livros'),
          _itemMenu(context, Icons.star, 'Destaques', '/destaques'),
          _itemMenu(context, Icons.category, 'Gêneros', '/generos'),
          _itemMenu(context, Icons.event, 'Eventos', '/eventos'),
          _itemMenu(context, Icons.contact_page, 'Contato', '/contato'),
          const Divider(color: Colors.white30),
          _itemMenu(context, Icons.login, 'Login', '/login'),
        ],
      ),
    );
  }

  Widget _itemMenu(
    BuildContext context,
    IconData icone,
    String titulo,
    String rota,
  ) {
    return ListTile(
      leading: Icon(
        icone,
        color: Colors.white,
      ),
      title: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, rota);
      },
    );
  }
}