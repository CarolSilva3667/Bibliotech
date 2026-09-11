import 'package:flutter/material.dart';
import '../dados.dart';
import 'detalhes_livro.dart';
import 'aviso_emprestimo.dart';

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
      'autor': 'Hannah Nicole Maehrer',
      'descricao': 'Evie Sage precisa desesperadamente de um emprego e acaba aceitando trabalhar para o homem mais temido do reino. O problema é que seu novo chefe é um poderoso vilão cercado por criaturas perigosas, planos misteriosos e uma equipe bastante incomum. Entre situações caóticas e sentimentos inesperados, Evie começa a descobrir que talvez o Vilão não seja exatamente quem ela imaginava.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 1.jpg',
    },
    {
      'id': '2',
      'titulo': 'Aprendiz do Vilão',
      'autor': 'Hannah Nicole Maehrer',
      'descricao': 'Depois de se tornar assistente do Vilão, Evie Sage acaba cada vez mais envolvida nos planos de seu chefe. Enquanto tenta entender seu novo trabalho e lidar com os perigos que aparecem pelo caminho, ela percebe que as coisas no reino são muito mais complicadas do que parecem. Novos desafios colocam sua lealdade e seus sentimentos à prova.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 2.jpg',
    },
    {
      'id': '3',
      'titulo': 'Aliada do Vilão',
      'autor': 'Hannah Nicole Maehrer',
      'descricao': 'Evie Sage já está completamente envolvida com o mundo do Vilão, mas novos acontecimentos tornam sua posição ainda mais complicada. Enquanto ameaças surgem por todos os lados, ela precisa decidir em quem confiar e até onde está disposta a ir para proteger aqueles que considera importantes.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 6.jpg',
    },
    {
      'id': '4',
      'titulo': 'Quarta Asa',
      'autor': 'Rebecca Yarros',
      'descricao': 'Violet Sorrengail sempre foi preparada para passar a vida entre livros e documentos, mas é obrigada a entrar no brutal mundo dos cavaleiros de dragões. Na academia militar, ela precisa sobreviver a treinamentos perigosos, rivais e desafios que podem custar sua vida. Ao mesmo tempo, Violet descobre que existem segredos muito maiores escondidos por trás da guerra.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 3.jpg',
    },
    {
      'id': '5',
      'titulo': 'Chama de Ferro',
      'autor': 'Rebecca Yarros',
      'descricao': 'Violet retorna ao segundo ano na academia ainda carregando as consequências dos acontecimentos anteriores. Além de enfrentar novos desafios e inimigos, ela precisa dominar suas habilidades e descobrir mais sobre os segredos que cercam a guerra. Enquanto isso, ameaças cada vez maiores começam a colocar em risco tudo aquilo em que ela acredita.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 5.jpg',
    },
    {
      'id': '6',
      'titulo': 'Tempestade de Ônix',
      'autor': 'Rebecca Yarros',
      'descricao': 'Violet está determinada a descobrir a verdade sobre a guerra e encontrar uma forma de proteger aqueles que ama. Para isso, precisa atravessar novos territórios, enfrentar inimigos ainda mais perigosos e lidar com segredos que podem mudar completamente sua visão sobre o conflito. Dragões, alianças e poderes antigos tornam sua missão ainda mais arriscada.',
      'genero': 'Fantasia',
      'imagem': 'assets/Livro 7.jpg',
    },
    {
      'id': '7',
      'titulo': 'A Paciente Silenciosa',
      'autor': 'Alex Michaelides',
      'descricao': 'Alicia Berenson é uma pintora famosa que leva uma vida aparentemente perfeita até ser acusada de matar o próprio marido. Depois do crime, ela permanece em silêncio e nunca mais pronuncia uma palavra. O psicoterapeuta Theo Faber fica obcecado pelo caso e decide descobrir o que realmente aconteceu naquela noite.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 4.jpg',
    },
    {
      'id': '8',
      'titulo': 'O Fabricante de Lágrimas',
      'autor': 'Erin Doom',
      'descricao': 'Nica cresceu em um orfanato e sempre ouviu histórias sobre o misterioso Fabricante de Lágrimas, uma figura responsável por criar os maiores medos e inseguranças das pessoas. Quando finalmente deixa o orfanato, ela é adotada junto com Rigel, um garoto com quem possui uma relação complicada. Entre os dois surge uma conexão intensa enquanto tentam enfrentar as marcas do passado.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 8.jpg',
    },
    {
      'id': '9',
      'titulo': 'Como Matei Minha Querida Família',
      'autor': 'Bella Mackie',
      'descricao': 'Grace Bernard acredita ter sido destruída pela própria família e decide que todos precisam pagar pelo que fizeram. Ela começa então a planejar cuidadosamente uma vingança contra seus parentes, transformando cada morte em uma etapa de seu plano. Enquanto tenta escapar das consequências de seus atos, Grace também registra sua própria versão dos acontecimentos.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 9.jpg',
    },
    {
      'id': '10',
      'titulo': 'Quebrando o Gelo',
      'autor': 'Hannah Grace',
      'descricao': 'Hannah Brooks é uma patinadora determinada que precisa conciliar sua carreira no gelo com a pressão das competições. Quando seu caminho se cruza com o de um jogador de hóquei, os dois percebem que precisam lidar não apenas com suas diferenças, mas também com uma atração que cresce a cada encontro. O romance se desenvolve enquanto ambos tentam equilibrar sentimentos e objetivos pessoais.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 10.jpg',
    },
    {
      'id': '11',
      'titulo': 'Academia dos Casos Arquivados',
      'autor': 'Jennifer Lynn Barnes',
      'descricao': 'Um grupo de jovens com habilidades extraordinárias é recrutado para ajudar em investigações de casos que nunca foram solucionados. Usando lógica, observação e conhecimentos específicos, eles começam a analisar crimes antigos. Quanto mais casos investigam, mais percebem que alguns mistérios podem estar ligados a acontecimentos muito maiores.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 11.jpg',
    },
    {
      'id': '12',
      'titulo': 'Instinto Assassino',
      'autor': 'Jennifer Lynn Barnes',
      'descricao': 'Um novo caso chama a atenção dos investigadores quando crimes recentes começam a apresentar características semelhantes às de assassinatos cometidos no passado. Enquanto procuram pistas, eles percebem que o criminoso parece conhecer detalhes que deveriam estar escondidos. A investigação se transforma em uma corrida contra o tempo para descobrir quem está por trás dos crimes.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 12.jpg',
    },
    {
      'id': '13',
      'titulo': 'Tudo ou Nada',
      'autor': 'Jennifer Lynn Barnes',
      'descricao': 'Os Naturais precisam enfrentar uma investigação ainda mais perigosa quando um novo caso coloca suas habilidades à prova. Cada integrante precisa usar sua capacidade de analisar pessoas, padrões e comportamentos para encontrar respostas. Conforme as pistas aparecem, o grupo percebe que cometer um único erro pode colocar todos em perigo.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 13.jpg',
    },
    {
      'id': '14',
      'titulo': 'Conflitos de Sangue',
      'autor': 'Jennifer Lynn Barnes',
      'descricao': 'Uma investigação envolvendo famílias, segredos antigos e acontecimentos violentos começa a revelar conexões que ninguém esperava encontrar. Conforme o passado volta à tona, os personagens precisam enfrentar conflitos que foram escondidos durante anos. Cada nova descoberta muda a compreensão sobre o que realmente aconteceu.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 14.jpg',
    },
    {
      'id': '15',
      'titulo': 'A Cinco Passos de Você',
      'autor': 'Rachael Lippincott',
      'descricao': 'Stella Grant passa a maior parte de sua vida no hospital por causa de uma doença que exige cuidados constantes. Lá, ela conhece Will, outro jovem que também enfrenta problemas de saúde. Os dois começam a desenvolver sentimentos, mas precisam manter uma distância segura para não colocar suas vidas em risco. A proximidade que desejam se torna justamente aquilo que não podem ter.',
      'genero': 'Romance',
      'imagem': 'assets/Livro 15.jpg',
    },
    {
      'id': '16',
      'titulo': 'Casamento Perfeito',
      'autor': 'Jeneva Rose',
      'descricao': 'Sarah Morgan é uma advogada especializada em defender pessoas acusadas de crimes graves. Quando seu próprio marido é acusado de assassinato, ela decide assumir a defesa dele. Porém, conforme começa a investigar o caso, Sarah encontra informações que fazem surgir dúvidas sobre o homem com quem se casou e sobre o que realmente aconteceu.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 16.jpg',
    },
    {
      'id': '17',
      'titulo': 'O Jardim das Borboletas',
      'autor': 'Dot Hutchison',
      'descricao': 'Um grupo de jovens mulheres é mantido em cativeiro por um homem que as chama de suas “borboletas”. Quando a polícia finalmente descobre o local, uma sobrevivente começa a contar o que aconteceu. Conforme seu relato avança, os investigadores descobrem uma história marcada por violência, manipulação e segredos perturbadores.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 17.jpg',
    },
    {
      'id': '18',
      'titulo': 'Boas Garotas se Afogam em Silêncio',
      'autor': 'Bethany Heath',
      'descricao': 'Uma investigação envolvendo uma jovem desaparecida começa a revelar segredos escondidos dentro de uma comunidade aparentemente tranquila. Enquanto as pessoas próximas tentam descobrir o que aconteceu, antigas histórias e conflitos voltam à superfície. Quanto mais respostas aparecem, mais perguntas surgem sobre quem realmente está dizendo a verdade.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 18.jpg',
    },
    {
      'id': '19',
      'titulo': 'Ninguém Vai te Ouvir Gritar',
      'autor': 'D. S. Butler',
      'descricao': 'Um desaparecimento aparentemente sem explicação leva uma jovem a investigar acontecimentos que outras pessoas prefeririam esquecer. Conforme ela segue as pistas, percebe que existe alguém disposto a fazer qualquer coisa para impedir que a verdade seja descoberta. O suspense aumenta enquanto ela tenta encontrar respostas antes que seja tarde demais.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 19.jpg',
    },
    {
      'id': '20',
      'titulo': 'Garotos Mortos Não Sangram',
      'autor': 'Mark W. Clark',
      'descricao': 'Um grupo de adolescentes acaba envolvido em um mistério sombrio depois que acontecimentos estranhos começam a surgir ao redor deles. Enquanto tentam entender o que está acontecendo, descobrem que algumas pessoas escondem segredos perigosos. A investigação leva o grupo cada vez mais fundo em uma história que mistura mistério, medo e acontecimentos inesperados.',
      'genero': 'Suspense',
      'imagem': 'assets/Livro 20.jpg',
    },
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

  List<Map<String, String>> get livrosFiltrados {
    final busca = buscaController.text.toLowerCase();

    return livros.where((livro) {
      return livro['titulo']!.toLowerCase().contains(busca) ||
          livro['autor']!.toLowerCase().contains(busca) ||
          livro['descricao']!.toLowerCase().contains(busca) ||
          livro['genero']!.toLowerCase().contains(busca);
    }).toList();
  }

  void abrirDetalhes(Map<String, String> livro) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesLivroPage(
          livro: livro,
        ),
      ),
    ).then((_) {
      setState(() {});
    });
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

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AvisoEmprestimoPage(
          livro: livro,
        ),
      ),
    ).then((resultado) {
      if (resultado == true) {
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${livro['titulo']} foi emprestado com sucesso!',
            ),
          ),
        );
      }
    });
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
                hintText: 'Buscar livro, autor ou gênero...',
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
                  child: GestureDetector(
                    onTap: () {
                      abrirDetalhes(livro);
                    },
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
                          const SizedBox(height: 5),
                          Text(
                            livro['autor']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            livro['descricao']!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Gênero: ${livro['genero']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
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
                                padding: const EdgeInsets.symmetric(
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
                  ),
                );
              },
            ),
          ),
        ],
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