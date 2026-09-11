import 'package:flutter/material.dart';

class DetalhesEventoPage extends StatelessWidget {
  final String evento;

  const DetalhesEventoPage({
    super.key,
    required this.evento,
  });

  Map<String, String> obterDetalhes() {
    final detalhes = {
      'Halloween': {
        'descricao':
            'Uma programação especial de Halloween preparada para os alunos, com decoração temática, atividades, histórias de terror e uma seleção de livros assustadores disponíveis na biblioteca.',
        'local': 'Biblioteca',
        'publico': 'Alunos e comunidade escolar',
      },
      'Live SELIBI': {
        'descricao':
            'Encontro online dedicado à biblioteca e à importância da leitura. A atividade apresenta informações sobre projetos, iniciativas e ações desenvolvidas para incentivar o hábito de ler.',
        'local': 'Online',
        'publico': 'Alunos e comunidade escolar',
      },
      'Hora da Leitura': {
        'descricao':
            'Um momento reservado para deixar a rotina de lado e aproveitar a leitura. Os participantes podem escolher um livro do acervo e passar um período tranquilo lendo na biblioteca.',
        'local': 'Biblioteca',
        'publico': 'Alunos',
      },
      'Sorteio de Livros': {
        'descricao':
            'Uma oportunidade para os participantes concorrerem a livros selecionados pela biblioteca. O objetivo é incentivar a leitura e aproximar os alunos de novos autores e histórias.',
        'local': 'Biblioteca',
        'publico': 'Alunos participantes',
      },
      'Feira de Troca de Livros': {
        'descricao':
            'Os participantes podem levar livros que já leram e trocá-los por outras obras disponíveis na feira. Uma forma de renovar a estante sem deixar livros parados.',
        'local': 'Biblioteca',
        'publico': 'Alunos e comunidade escolar',
      },
      'Palestra com Autor Convidado': {
        'descricao':
            'Um autor convidado conversa com os participantes sobre literatura, processo de escrita, criação de personagens e experiências durante a produção de seus livros.',
        'local': 'Auditório',
        'publico': 'Alunos e comunidade escolar',
      },
      'Clube de Leitura': {
        'descricao':
            'Encontro para conversar sobre uma obra escolhida previamente. Os participantes podem compartilhar opiniões, interpretar personagens, discutir acontecimentos e trocar recomendações.',
        'local': 'Biblioteca',
        'publico': 'Alunos participantes',
      },
      'Oficina de Escrita Criativa': {
        'descricao':
            'Atividade prática para desenvolver a criatividade na escrita. Os participantes aprendem técnicas para criar personagens, cenários, diálogos e pequenas histórias.',
        'local': 'Biblioteca',
        'publico': 'Alunos',
      },
      'Sessão de Contação de Histórias': {
        'descricao':
            'Uma sessão dedicada à contação de histórias, com narrativas escolhidas para estimular a imaginação e despertar o interesse pela leitura.',
        'local': 'Biblioteca',
        'publico': 'Alunos',
      },
      'Exposição de Livros Raros': {
        'descricao':
            'Exposição especial com livros de diferentes épocas e edições que possuem características históricas ou especiais. Os visitantes poderão conhecer um pouco mais sobre essas obras.',
        'local': 'Biblioteca',
        'publico': 'Alunos e comunidade escolar',
      },
      'Maratona de Leitura': {
        'descricao':
            'Um dia inteiro dedicado à leitura. Os participantes podem escolher diferentes obras do acervo e aproveitar o espaço da biblioteca para avançar em suas leituras ao longo do dia.',
        'local': 'Biblioteca',
        'publico': 'Alunos participantes',
      },
      'Encontro com Escritores Locais': {
        'descricao':
            'Encontro com escritores da região para conhecer suas trajetórias, conversar sobre literatura e descobrir como é o processo de criação de uma obra publicada.',
        'local': 'Biblioteca',
        'publico': 'Alunos e comunidade escolar',
      },
    };

    for (final chave in detalhes.keys) {
      if (evento.startsWith(chave)) {
        return detalhes[chave]!;
      }
    }

    return {
      'descricao':
          'Participe desta atividade organizada pela Biblioteca Virtual e aproveite a oportunidade para conhecer novas experiências relacionadas à leitura.',
      'local': 'Biblioteca',
      'publico': 'Comunidade escolar',
    };
  }

  @override
  Widget build(BuildContext context) {
    final partes = evento.split(' - ');
    final nome = partes.isNotEmpty ? partes[0] : evento;
    final data = partes.length > 1 ? partes[1] : 'Data não informada';
    final horario =
        partes.length > 2 ? partes[2] : 'Horário não informado';
    final detalhes = obterDetalhes();

    return Scaffold(
      backgroundColor: const Color(0xFF120005),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C0315),
        foregroundColor: Colors.white,
        title: const Text('Detalhes do Evento'),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF880024),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.event,
                color: Colors.white,
                size: 80,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              nome,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Data: $data',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Horário: $horario',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Local: ${detalhes['local']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Público: ${detalhes['publico']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Sobre o evento',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    detalhes['descricao']!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}