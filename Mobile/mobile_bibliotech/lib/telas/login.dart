import 'package:flutter/material.dart';
import '../dados.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  String tipoUsuario = 'aluno';

  void entrar() {
    final usuario = usuarioController.text.trim();
    final senha = senhaController.text;

    if (usuario.isEmpty || senha.isEmpty) {
      mostrarMensagem('Preencha todos os campos.');
      return;
    }

    if (tipoUsuario == 'bibliotecario') {
      if (usuario != 'bibliotecario' || senha != '1234') {
        mostrarMensagem(
          'Usuário ou senha do bibliotecário incorretos.',
        );
        return;
      }
    }

    DadosApp.logado = true;
    DadosApp.usuario = usuario;

    final rotaAnterior =
        ModalRoute.of(context)?.settings.arguments as String?;

    if (rotaAnterior != null && rotaAnterior.isNotEmpty) {
      Navigator.pushReplacementNamed(context, rotaAnterior);
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Biblioteca Virtual'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Color(0xFF3C0315),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    hintText: 'Digite seu usuário',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  initialValue: tipoUsuario,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de acesso',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'aluno',
                      child: Text('Aluno'),
                    ),
                    DropdownMenuItem(
                      value: 'bibliotecario',
                      child: Text('Bibliotecário'),
                    ),
                  ],
                  onChanged: (valor) {
                    if (valor != null) {
                      setState(() {
                        tipoUsuario = valor;
                      });
                    }
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: entrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C0315),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}