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

            const Text(
              'Acesse rapidamente',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _botao(
              context,
              '📚 Catálogo',
              'Veja todos os livros disponíveis na biblioteca.',
              '/catalogo',
            ),

            _botao(
              context,
              '📖 Meus Livros',
              'Confira os livros que estão emprestados em seu nome.',
              '/meus-livros',
            ),

            _botao(
              context,
              '📅 Eventos',
              'Confira os eventos da biblioteca.',
              '/eventos',
            ),

            _botao(
              context,
              '👤 Login',
              'Entre para acessar sua conta.',
              '/login',
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _botao(
    BuildContext context,
    String titulo,
    String descricao,
    String rota,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF880024),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            descricao,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                rota,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C0315),
              foregroundColor: Colors.white,
            ),
            child: const Text('Acessar'),
          ),
        ],
      ),
    );
  }
}