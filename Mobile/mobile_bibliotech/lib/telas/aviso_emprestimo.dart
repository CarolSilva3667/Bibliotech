import 'package:flutter/material.dart';
import '../dados.dart';

class AvisoEmprestimoPage extends StatelessWidget {
  final Map<String, String> livro;

  const AvisoEmprestimoPage({
    super.key,
    required this.livro,
  });

  void confirmarEmprestimo(BuildContext context) {
    DadosApp.emprestarLivro(livro);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Aviso de Empréstimo'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.amber,
              size: 70,
            ),
            const SizedBox(height: 15),
            const Text(
              'ATENÇÃO!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
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
              child: const Text(
                'Caso houver atraso na devolução do livro sem reajuste de prazo, '
                'o sistema irá emitir uma nota que proibirá o usuário(a) de '
                'realizar novos empréstimos durante um período de 15 dias.\n\n'
                'Caso o atraso passe de 3 dias será cobrada multa de R\$ 5,00.\n\n'
                'Em caso de rasgos, manchas ou perda dos livros emprestados, '
                'o usuário(a) ficará impedido de realizar novos empréstimos '
                'por um período de 1 mês. Além de receber uma multa por danos '
                'ao livro. O valor varia de acordo com o nível de dano.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF880024),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Observação:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'O período que o usuário(a) ficará sem poder realizar '
                    'novos empréstimos poderá variar de acordo com o atraso '
                    'da devolução!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Livro selecionado:\n${livro['titulo']}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => confirmarEmprestimo(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF880024),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Entendi e quero emprestar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white54,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 16,
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