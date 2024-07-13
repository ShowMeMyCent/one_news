import 'package:one_news/core/resources/data_state.dart';
import 'package:one_news/core/usecases/usecase.dart';
import 'package:one_news/feature/daily_news/domain/entities/article.dart';
import 'package:one_news/feature/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements Usecase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
