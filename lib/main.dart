import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_news/config/routes/routes.dart';
import 'package:one_news/config/theme/app_theme.data.dart';
import 'package:one_news/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:one_news/feature/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:one_news/feature/daily_news/presentation/pages/home/daily_news.dart';
import 'package:one_news/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
        theme: theme(),
      ),
    );
  }
}
