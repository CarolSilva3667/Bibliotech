import 'package:flutter/material.dart';
import 'detalhes_livro.dart';

class DestaquesPage extends StatelessWidget {
  const DestaquesPage({super.key});

  final List<Map<String, String>> livros = const [
    {
      'id': '21',
      'titulo': 'Frankenstein',
      'autor': 'Mary Shelley',
      'genero': 'Terror',
      'descricao':
          'Victor Frankenstein é um jovem cientista fascinado pelos limites da vida. Em busca de descobrir os segredos da criação, ele realiza um experimento que resulta no surgimento de uma criatura. Assustado com o que criou, Victor abandona sua própria criação, dando início a uma história marcada por solidão, rejeição, vingança e pelas consequências de brincar com os limites da ciência.',
      'imagem': 'assets/Frank.jpg',
    },
    {
      'id': '22',
      'titulo': 'Drácula',
      'autor': 'Bram Stoker',
      'genero': 'Terror',
      'descricao':
          'Jonathan Harker viaja até a distante Transilvânia para ajudar o misterioso Conde Drácula em uma negociação. Aos poucos, ele percebe que seu anfitrião esconde uma natureza assustadora. Quando Drácula decide deixar seu castelo e partir para a Inglaterra, uma série de acontecimentos sobrenaturais coloca várias pessoas em perigo.',
      'imagem': 'assets/Drac.jpg',
    },
    {
      'id': '23',
      'titulo': 'Desenhos Ocultos',
      'autor': 'Jason Rekulak',
      'genero': 'Suspense',
      'descricao':
          'Maeve começa a trabalhar como babá de uma menina chamada Teddy e percebe que os desenhos feitos pela criança são muito mais estranhos do que deveriam ser. Algumas ilustrações parecem representar acontecimentos que ninguém contou a Teddy. Conforme Maeve tenta descobrir o significado das imagens, ela acaba se aproximando de um segredo assustador escondido pela família.',
      'imagem': 'assets/desenhos.jpg',
    },
    {
      'id': '24',
      'titulo': 'O Acidente',
      'autor': 'Freida McFadden',
      'genero': 'Suspense',
      'descricao':
          'Um acidente aparentemente comum acaba desencadeando uma sequência de acontecimentos inesperados. Conforme a história avança, informações escondidas começam a aparecer e fazem os personagens questionarem em quem podem realmente confiar. O suspense cresce a cada descoberta e transforma um acontecimento aparentemente simples em algo muito maior.',
      'imagem': 'assets/Livro 21.jpg',
    },
    {
      'id': '25',
      'titulo': 'Com Amor Mamãe',
      'autor': 'Iliana Xander',
      'genero': 'Romance',
      'descricao':
          'A história acompanha personagens ligados por relações familiares, sentimentos e acontecimentos que mudam suas vidas. Entre lembranças, conflitos e descobertas, a narrativa mostra como o amor e os vínculos familiares podem permanecer presentes mesmo quando tudo parece ter mudado.',
      'imagem': 'assets/Livro 22.jpg',
    },
    {
      'id': '26',
      'titulo': 'Rainha Vermelha',
      'autor': 'Victoria Aveyard',
      'genero': 'Fantasia',
      'descricao':
          'Mare Barrow vive em uma sociedade dividida pela cor do sangue: os Prateados possuem poderes e dominam os Vermelhos, que vivem em condições de desigualdade. Quando Mare descobre que também possui uma habilidade extraordinária, sua existência passa a ameaçar todo o sistema. Forçada a viver entre aqueles que deveria combater, ela precisa esconder sua verdadeira identidade enquanto uma rebelião começa a crescer.',
      'imagem': 'assets/Livro 23.jpg',
    },
    {
      'id': '27',
      'titulo': 'Assombrando Adeline',
      'autor': 'H. D. Carlton',
      'genero': 'Dark Romance',
      'descricao':
          'Adeline se muda para uma antiga casa que pertenceu à sua família e começa a investigar acontecimentos ligados ao passado do local. Enquanto tenta descobrir os segredos deixados por seus antepassados, ela percebe que alguém está observando seus passos. A história mistura mistério, tensão e um relacionamento marcado por uma atmosfera sombria.',
      'imagem': 'assets/Livro 24.jpg',
    },
    {
      'id': '28',
      'titulo': 'Cutelo e Corvo',
      'autor': 'Brynne Weaver',
      'genero': 'Dark Romance',
      'descricao':
          'Duas pessoas com vidas perigosas acabam se aproximando em uma situação completamente inesperada. Entre violência, humor ácido e sentimentos que nenhum dos dois pretendia desenvolver, a história acompanha uma relação pouco convencional e cheia de acontecimentos imprevisíveis.',
      'imagem': 'assets/Livro 25.jpg',
    },
  ];

  void abrirDetalhes(BuildContext context, Map<String, String> livro) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesLivroPage(
          livro: livro,
        ),
      ),
    );
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      drawer: _menu(context),
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
            ...livros.map(
              (livro) => GestureDetector(
                onTap: () {
                  abrirDetalhes(context, livro);
                },
                child: Container(
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
                      const SizedBox(height: 8),
                      const Text(
                        'Toque para ver detalhes',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF120005),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF3C0315),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Biblioteca Virtual 📚',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _itemMenu(context, Icons.home, 'Início', '/home'),
          _itemMenu(context, Icons.menu_book, 'Catálogo', '/catalogo'),
          _itemMenu(context, Icons.book, 'Meus Livros', '/meus-livros'),
          _itemMenu(context, Icons.star, 'Destaques', '/destaques'),
          _itemMenu(context, Icons.category, 'Gêneros', '/generos'),
          _itemMenu(context, Icons.event, 'Eventos', '/eventos'),
          _itemMenu(context, Icons.contact_page, 'Contato', '/contato'),
          const Divider(color: Colors.white30),
          _itemMenu(context, Icons.login, 'Login', '/login'),
        ],
      ),
    );
  }

  Widget _itemMenu(
    BuildContext context,
    IconData icone,
    String titulo,
    String rota,
  ) {
    return ListTile(
      leading: Icon(
        icone,
        color: Colors.white,
      ),
      title: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, rota);
      },
    );
  }
}