import 'package:flutter/material.dart';

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
              'Eventos Agendados',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ...eventos.map(
              (evento) => Container(
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
                child: Text(
                  evento,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}