import 'package:flutter/material.dart';

import 'telas/home.dart';
import 'telas/destaques.dart';
import 'telas/generos.dart';
import 'telas/catalogo.dart';
import 'telas/meus_livros.dart';
import 'telas/login.dart';
import 'telas/eventos.dart';
import 'telas/contato.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca Virtual',
      home: const HomePage(),
      routes: {
        '/catalogo': (context) => const CatalogoPage(),
        '/meus-livros': (context) => const MeusLivrosPage(),
        '/eventos': (context) => const EventosPage(),
        '/login': (context) => const LoginPage(),
        '/destaques': (context) => const DestaquesPage(),
        '/generos': (context) => const GenerosPage(),
        '/contato': (context) => const ContatoPage(),
      },
    );
  }
}