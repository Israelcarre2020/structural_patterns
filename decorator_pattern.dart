abstract class Article {
  String getContent();
}

// Componente Concreto
class SimpleArticle implements Article {
  String _content;

  SimpleArticle(this._content);

  @override
  String getContent() => _content;
}

// Decorador Abstracto
abstract class ArticleDecorator implements Article {
  final Article article;

  ArticleDecorator(this.article);

  @override
  String getContent() => article.getContent();
}

// Decorador Concreto: Agrega formato HTML
class HTMLFormatter extends ArticleDecorator {
  HTMLFormatter(Article article) : super(article);

  @override
  String getContent() => "<html><body>${super.getContent()}</body></html>";
}

// Decorador Concreto: Cuenta palabras
class WordCounter extends ArticleDecorator {
  WordCounter(Article article) : super(article);

  int countWords() => super.getContent().split(' ').length;
}

// Decorador Concreto: Agrega un resumen SEO
class SEOSummary extends ArticleDecorator {
  SEOSummary(Article article) : super(article);

  String addSummary() => "${super.getContent()}... [Read more]";
}

void main() {
  Article article = SimpleArticle("This is an article.");

  article = HTMLFormatter(article);

  WordCounter counter = WordCounter(article);

  SEOSummary seoSummary = SEOSummary(article);

  print(article.getContent());
  print("Word Count: ${counter.countWords()}");
  print(seoSummary.addSummary());
}
