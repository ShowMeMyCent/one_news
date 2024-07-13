import 'package:one_news/core/resources/data_state.dart';
import 'package:one_news/feature/daily_news/domain/usecases/get_article.dart';
import 'package:one_news/feature/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:one_news/feature/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:bloc/bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;
  RemoteArticleBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
