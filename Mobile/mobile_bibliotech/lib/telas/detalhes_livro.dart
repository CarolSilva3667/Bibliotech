import 'package:flutter/material.dart';
import '../dados.dart';
import 'avaliacoes.dart';
import 'aviso_emprestimo.dart';

class DetalhesLivroPage extends StatefulWidget {
  final Map<String, String> livro;

  const DetalhesLivroPage({
    super.key,
    required this.livro,
  });

  @override
  State<DetalhesLivroPage> createState() => _DetalhesLivroPageState();
}

class _DetalhesLivroPageState extends State<DetalhesLivroPage> {
  void abrirAviso() {
    if (!DadosApp.logado) {
      Navigator.pushNamed(
        context,
        '/login',
        arguments: '/catalogo',
      );
      return;
    }

    if (DadosApp.livroEmprestado(widget.livro['id']!)) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvisoEmprestimoPage(
          livro: widget.livro,
        ),
      ),
    ).then((resultado) {
      if (resultado == true) {
        setState(() {});
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${widget.livro['titulo']} foi emprestado com sucesso!',
            ),
          ),
        );
      }
    });
  }

  void abrirAvaliacoes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvaliacoesPage(
          livro: widget.livro,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emprestado =
        DadosApp.livroEmprestado(widget.livro['id']!);

    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Detalhes do Livro'),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.livro['imagem']!,
                width: 220,
                height: 330,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.livro['titulo']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.livro['autor'] ?? 'Autor não informado',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3C0315),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informações',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Autor: ${widget.livro['autor'] ?? 'Não informado'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Gênero: ${widget.livro['genero'] ?? 'Não informado'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    emprestado
                        ? 'Status: 🔴 Emprestado'
                        : 'Status: 🟢 Disponível',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sinopse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.livro['descricao']!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: abrirAvaliacoes,
                icon: const Icon(Icons.star),
                label: const Text(
                  'Ver avaliações',
                  style: TextStyle(fontSize: 17),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFF880024),
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: emprestado ? null : abrirAviso,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF880024),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade700,
                  disabledForegroundColor: Colors.white70,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  emprestado
                      ? '🔴 Livro Emprestado'
                      : 'Emprestar Livro',
                  style: const TextStyle(
                    fontSize: 17,
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