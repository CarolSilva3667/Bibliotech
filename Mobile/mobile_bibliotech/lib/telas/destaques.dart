import 'package:flutter/material.dart';

class DestaquesPage extends StatelessWidget {
  const DestaquesPage({super.key});

  final List<Map<String, String>> livros = const [
    {
      'titulo': 'Frankenstein',
      'autor': 'Mary Shelley',
      'imagem': 'assets/Frank.jpg',
    },
    {
      'titulo': 'Drácula',
      'autor': 'Bram Stoker',
      'imagem': 'assets/Drac.jpg',
    },
    {
      'titulo': 'Desenhos Ocultos',
      'autor': 'Jason Rekulak',
      'imagem': 'assets/desenhos.jpg',
    },
    {
      'titulo': 'O Acidente',
      'autor': 'Freida McFadden',
      'imagem': 'assets/Livro 21.jpg',
    },
    {
      'titulo': 'Com Amor Mamãe',
      'autor': 'Iliana Xander',
      'imagem': 'assets/Livro 22.jpg',
    },
    {
      'titulo': 'Rainha Vermelha',
      'autor': 'Victoria Aveyard',
      'imagem': 'assets/Livro 23.jpg',
    },
    {
      'titulo': 'Assombrando Adeline',
      'autor': 'H. D. Carlton',
      'imagem': 'assets/Livro 24.jpg',
    },
    {
      'titulo': 'Cutelo e Corvo',
      'autor': 'Brynne Weaver',
      'imagem': 'assets/Livro 25.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Biblioteca Virtual 📚'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Destaques da Semana! 📔',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Essa semana os livros em destaque são:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            ...livros.map((livro) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 25),
                padding: const EdgeInsets.all(18),
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
                    Image.asset(
                      livro['imagem']!,
                      width: 180,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${livro['titulo']} - ${livro['autor']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}