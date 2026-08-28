import 'package:flutter/material.dart';
import '../dados.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({super.key});

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  final TextEditingController buscaController = TextEditingController();

  final List<Map<String, String>> livros = [
    {
      'id': '1',
      'titulo': 'Assistente do Vilão',
      'descricao': 'Evie Sage se torna assistente do temido Vilão.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 1.jpg',
    },
    {
      'id': '2',
      'titulo': 'Aprendiz do Vilão',
      'descricao': 'Evie precisa proteger o reino.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 2.jpg',
    },
    {
      'id': '3',
      'titulo': 'Aliada do Vilão',
      'descricao': 'Novos desafios aguardam Evie.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 6.jpg',
    },
    {
      'id': '4',
      'titulo': 'Quarta Asa',
      'descricao': 'Violet entra na academia de dragões.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 3.jpg',
    },
    {
      'id': '5',
      'titulo': 'Chama de Ferro',
      'descricao': 'Segredos do instituto são revelados.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 5.jpg',
    },
    {
      'id': '6',
      'titulo': 'Tempestade de Ônix',
      'descricao': 'Violet busca aliados fora de Navarre.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 7.jpg',
    },
    {
      'id': '7',
      'titulo': 'A Paciente Silenciosa',
      'descricao': 'Um crime muda completamente uma família.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 4.jpg',
    },
    {
      'id': '8',
      'titulo': 'O Fabricante de Lágrimas',
      'descricao': 'Dois jovens descobrem sentimentos inesperados.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 8.jpg',
    },
    {
      'id': '9',
      'titulo': 'Como Matei Minha Querida Família',
      'descricao': 'Uma jovem busca vingança.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 9.jpg',
    },
    {
      'id': '10',
      'titulo': 'Quebrando o Gelo',
      'descricao': 'Um romance entre atletas.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 10.jpg',
    },
    {
      'id': '11',
      'titulo': 'Academia dos Casos Arquivados',
      'descricao': 'Jovens ajudam o FBI a resolver crimes antigos.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 11.jpg',
    },
    {
      'id': '12',
      'titulo': 'Instinto Assassino',
      'descricao': 'Um assassino copia crimes antigos.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 12.jpg',
    },
    {
      'id': '13',
      'titulo': 'Tudo ou Nada',
      'descricao': 'Os Naturais enfrentam novos perigos.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 13.jpg',
    },
    {
      'id': '14',
      'titulo': 'Conflitos de Sangue',
      'descricao': 'Segredos do passado vêm à tona.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 14.jpg',
    },
    {
      'id': '15',
      'titulo': 'A Cinco Passos de Você',
      'descricao': 'Dois jovens vivem um amor impossível.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 15.jpg',
    },
    {
      'id': '16',
      'titulo': 'Casamento Perfeito',
      'descricao': 'Uma advogada defende seu marido acusado.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 16.jpg',
    },
    {
      'id': '17',
      'titulo': 'O Jardim das Borboletas',
      'descricao': 'Uma jovem revela segredos de um cativeiro.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 17.jpg',
    },
    {
      'id': '18',
      'titulo': 'Boas Garotas se Afogam em Silêncio',
      'descricao': 'Uma investigação revela segredos da escola.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 18.jpg',
    },
    {
      'id': '19',
      'titulo': 'Ninguém Vai te Ouvir Gritar',
      'descricao': 'Uma jovem tenta desvendar um desaparecimento.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 19.jpg',
    },
    {
      'id': '20',
      'titulo': 'Garotos Mortos Não Sangram',
      'descricao': 'Adolescentes envolvidos em um mistério sombrio.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 20.jpg',
    },
  ];

  List<Map<String, String>> get livrosFiltrados {
    final busca = buscaController.text.toLowerCase();

    return livros.where((livro) {
      return livro['titulo']!.toLowerCase().contains(busca) ||
          livro['descricao']!.toLowerCase().contains(busca) ||
          livro['genero']!.toLowerCase().contains(busca);
    }).toList();
  }

  void emprestar(Map<String, String> livro) {
    if (!DadosApp.logado) {
      Navigator.pushNamed(
        context,
        '/login',
        arguments: '/catalogo',
      );
      return;
    }

    if (DadosApp.livroEmprestado(livro['id']!)) {
      return;
    }

    setState(() {
      DadosApp.emprestarLivro(livro);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${livro['titulo']} foi emprestado com sucesso!',
        ),
      ),
    );
  }

  @override
  void dispose() {
    buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Catálogo de Livros'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: buscaController,
              onChanged: (_) {
                setState(() {});
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar livro ou gênero...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xFF3C0315),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: livrosFiltrados.length,
              itemBuilder: (context, index) {
                final livro = livrosFiltrados[index];
                final emprestado =
                    DadosApp.livroEmprestado(livro['id']!);

                return Opacity(
                  opacity: emprestado ? 0.45 : 1.0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF880024),
                      borderRadius: BorderRadius.circular(12),
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
                          livro['titulo']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          livro['descricao']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          emprestado
                              ? 'Status: 🔴 Emprestado'
                              : 'Status: 🟢 Disponível',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: emprestado
                                ? null
                                : () => emprestar(livro),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF3C0315),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                            ),
                            child: Text(
                              emprestado
                                  ? 'Livro Emprestado'
                                  : 'Emprestar',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}