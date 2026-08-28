import 'package:flutter/material.dart';

class GenerosPage extends StatelessWidget {
  const GenerosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Biblioteca Virtual 📚'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Gêneros Literários',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            _genero(
              context,
              'Suspense',
              'Histórias cheias de mistério, tensão e reviravoltas.',
            ),

            _genero(
              context,
              'Dark Romance',
              'Romances intensos com histórias sombrias e complexas.',
            ),

            _genero(
              context,
              'Romance',
              'Histórias sobre amor, relacionamentos e sentimentos.',
            ),

            _genero(
              context,
              'Fantasia',
              'Mundos mágicos, criaturas fantásticas e aventuras.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _genero(
    BuildContext context,
    String titulo,
    String descricao,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF880024),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            descricao,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/catalogo',
                  arguments: titulo,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3C0315),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Ver livros',
              ),
            ),
          ),
        ],
      ),
    );
  }
}