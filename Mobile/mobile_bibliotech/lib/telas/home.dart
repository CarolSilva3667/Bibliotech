import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Biblioteca Virtual 📚',
        ),
      ),
      drawer: Drawer(
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
            _itemMenu(
              context,
              Icons.home,
              'Início',
              '/home',
            ),
            _itemMenu(
              context,
              Icons.menu_book,
              'Catálogo',
              '/catalogo',
            ),
            _itemMenu(
              context,
              Icons.book,
              'Meus Livros',
              '/meus-livros',
            ),
            _itemMenu(
              context,
              Icons.star,
              'Destaques',
              '/destaques',
            ),
            _itemMenu(
              context,
              Icons.category,
              'Gêneros',
              '/generos',
            ),
            _itemMenu(
              context,
              Icons.event,
              'Eventos',
              '/eventos',
            ),
            _itemMenu(
              context,
              Icons.contact_page,
              'Contato',
              '/contato',
            ),
            const Divider(
              color: Colors.white30,
            ),
            _itemMenu(
              context,
              Icons.login,
              'Login',
              '/login',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/logo.jpg',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Bem-vindo à Biblioteca Virtual 📖',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Nossa biblioteca nasceu com o objetivo de unir tecnologia e literatura, criando uma experiência moderna, simples e acessível para todos os leitores.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Aqui você pode consultar livros disponíveis, acompanhar seus empréstimos, participar de eventos literários e descobrir novas histórias.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF4A0404),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    'Sobre a Biblioteca',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'A Biblioteca Virtual é uma plataforma criada para facilitar o acesso ao conhecimento, permitindo que alunos e leitores encontrem livros de diferentes gêneros, acompanhem seus empréstimos e tenham uma experiência organizada e eficiente.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Nosso objetivo é preservar a essência das bibliotecas tradicionais, utilizando a tecnologia como ferramenta para aproximar pessoas da leitura.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
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
        Navigator.pushReplacementNamed(
          context,
          rota,
        );
      },
    );
  }
}