import 'package:flutter/material.dart';
import 'detalhes_evento.dart';

class EventosPage extends StatelessWidget {
  const EventosPage({super.key});

  final List<String> eventos = const [
    'Halloween - 30/10/2025 - 9:30 às 10:30',
    'Live SELIBI - 05/04/2025 - 10h às 10:30',
    'Hora da Leitura - 18/08/2025 - 8h às 9h',
    'Sorteio de Livros - 15/10/2025 - 10h às 12h',
    'Feira de Troca de Livros - 20/10/2025 - 14h às 18h',
    'Palestra com Autor Convidado - 25/10/2025 - 19h às 21h',
    'Clube de Leitura - 28/10/2025 - 16h às 17h30',
    'Oficina de Escrita Criativa - 02/11/2025 - 15h às 17h',
    'Sessão de Contação de Histórias - 05/11/2025 - 10h às 11h',
    'Exposição de Livros Raros - 10/11/2025 - 09h às 17h',
    'Maratona de Leitura - 15/11/2025 - 08h às 20h',
    'Encontro com Escritores Locais - 18/11/2025 - 18h às 20h',
  ];

  void abrirDetalhes(BuildContext context, String evento) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesEventoPage(
          evento: evento,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Biblioteca Virtual 📚'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Eventos Agendados',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ...eventos.map(
              (evento) => GestureDetector(
                onTap: () {
                  abrirDetalhes(context, evento);
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF880024),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.event,
                        color: Colors.white,
                        size: 35,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        evento,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Toque para ver detalhes',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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