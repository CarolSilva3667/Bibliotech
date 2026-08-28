class DadosApp {
  static bool logado = false;
  static String usuario = '';

  static final List<Map<String, String>> meusLivros = [];

  static bool livroEmprestado(String id) {
    return meusLivros.any((livro) => livro['id'] == id);
  }

  static void emprestarLivro(Map<String, String> livro) {
    if (!livroEmprestado(livro['id']!)) {
      meusLivros.add({
        'id': livro['id']!,
        'livro': livro['titulo']!,
        'dataEmprestimo': '28/08/2026',
        'dataDevolucao': '11/09/2026',
      });
    }
  }
}