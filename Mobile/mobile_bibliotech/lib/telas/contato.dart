import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  Future<void> abrirLink(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
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
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                'Contatos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              _botaoContato(
                icone: Icons.email,
                texto: 'E-mail',
                onPressed: () {
                  abrirLink(
                    'mailto:technosystems098@gmail.com?subject=Contato%20TechnoSystems',
                  );
                },
              ),

              const SizedBox(height: 20),

              _botaoContato(
                icone: Icons.language,
                texto: 'Site Corporativo',
                onPressed: () {
                  abrirLink(
                    'https://www.technosystems.com.br',
                  );
                },
              ),

              const SizedBox(height: 20),

              _botaoContato(
                icone: Icons.chat,
                texto: 'WhatsApp',
                onPressed: () {
                  abrirLink(
                    'https://wa.me/551234567890?text=Olá,%20gostaria%20de%20mais%20informações.',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botaoContato({
    required IconData icone,
    required String texto,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icone),
        label: Text(texto),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF880024),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}