import 'package:one_news/core/resources/data_state.dart';
import 'package:one_news/core/usecases/usecase.dart';
import 'package:one_news/feature/daily_news/domain/entities/article.dart';
import 'package:one_news/feature/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements Usecase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
