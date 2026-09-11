import 'package:flutter/material.dart';

class AvaliacoesPage extends StatefulWidget {
  final Map<String, String> livro;

  const AvaliacoesPage({
    super.key,
    required this.livro,
  });

  @override
  State<AvaliacoesPage> createState() => _AvaliacoesPageState();
}

class _AvaliacoesPageState extends State<AvaliacoesPage> {
  final TextEditingController avaliacaoController =
      TextEditingController();

  int notaSelecionada = 0;

  final List<Map<String, dynamic>> avaliacoes = [
    {
      'usuario': 'Maria',
      'nota': 5,
      'comentario': 'Livro muito bom! A história prende bastante.',
    },
    {
      'usuario': 'João',
      'nota': 4,
      'comentario': 'Gostei bastante da leitura e dos personagens.',
    },
    {
      'usuario': 'Beatriz',
      'nota': 5,
      'comentario': 'Uma das minhas leituras favoritas!',
    },
  ];

  void enviarAvaliacao() {
    final comentario = avaliacaoController.text.trim();

    if (notaSelecionada == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escolha uma nota de 1 a 5 estrelas.'),
        ),
      );
      return;
    }

    if (comentario.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite uma avaliação.'),
        ),
      );
      return;
    }

    setState(() {
      avaliacoes.insert(0, {
        'usuario': 'Você',
        'nota': notaSelecionada,
        'comentario': comentario,
      });

      avaliacaoController.clear();
      notaSelecionada = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Avaliação enviada com sucesso!'),
      ),
    );
  }

  double calcularMedia() {
    if (avaliacoes.isEmpty) {
      return 0;
    }

    double total = 0;

    for (final avaliacao in avaliacoes) {
      total += avaliacao['nota'];
    }

    return total / avaliacoes.length;
  }

  Widget estrelas(int nota, {double tamanho = 22}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < nota ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: tamanho,
        ),
      ),
    );
  }

  @override
  void dispose() {
    avaliacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = calcularMedia();

    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Avaliações'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              widget.livro['titulo']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3C0315),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    media.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  estrelas(
                    media.round(),
                    tamanho: 30,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${avaliacoes.length} avaliações',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF880024),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avaliar livro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Escolha uma nota:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        final numero = index + 1;

                        return IconButton(
                          onPressed: () {
                            setState(() {
                              notaSelecionada = numero;
                            });
                          },
                          icon: Icon(
                            numero <= notaSelecionada
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 32,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: avaliacaoController,
                    maxLines: 4,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Escreva sua avaliação...',
                      hintStyle: const TextStyle(
                        color: Colors.white70,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF3C0315),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: enviarAvaliacao,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF3C0315),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        'Enviar avaliação',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Avaliações dos usuários',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ...avaliacoes.map(
              (avaliacao) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3C0315),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        avaliacao['usuario'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      estrelas(avaliacao['nota']),
                      const SizedBox(height: 10),
                      Text(
                        avaliacao['comentario'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}