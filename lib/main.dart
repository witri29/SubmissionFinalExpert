import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/ssl_helper.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie_now_playing_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series/home_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_now_playing_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/provider/bloc_tv_series/tv_bloc.dart';
import 'package:ditonton/presentation/provider/movie_bloc.dart';
import 'package:ditonton/presentation/provider/search_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SSLHelper.initializing();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SearchMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<NowPlayingMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<PopularMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<TopRatedMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<DetailMovieBloc>()),
        BlocProvider(create: (_) => di.locator<RecommendationMovieBloc>()),
        BlocProvider(create: (_) => di.locator<WatchListBloc>()),
        BlocProvider(create: (_) => di.locator<PopularTvBloc>()),
        BlocProvider(create: (_) => di.locator<TopRatedTvBloc>()),
        BlocProvider(create: (_) => di.locator<TvNowPlayingBloc>()),
        BlocProvider(create: (_) => di.locator<TvDetailBloc>()),
        BlocProvider(create: (_) => di.locator<RecommendationsTvBloc>()),
        BlocProvider(create: (_) => di.locator<WatchlistTvBloc>()),
        BlocProvider(create: (_) => di.locator<SearchTvBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case NowPlayingMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());

            case TvHomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvHomePage());
            case PopularTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case NowPlayingTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingTvPage());
            case TopRatedTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case TvDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case SearchTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchTvPage());
            case WatchlistTvPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistTvPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
