import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/provider/bloc_tv_series/tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class OnAirNowEventHelper extends Fake implements TvEvent {}

class OnAirNowStateHelper extends Fake implements TvState {}

class OnAirNowBlocHelper extends MockBloc<TvEvent, TvState>
    implements TvNowPlayingBloc {}

class PopularTvEventHelper extends Fake implements TvEvent {}

class PopularTvStateHelper extends Fake implements TvState {}

class PopularTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements PopularTvBloc {}

class TopRatedTvEventHelper extends Fake implements TvEvent {}

class TopRatedTvStateHelper extends Fake implements TvState {}

class TopRatedTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements TopRatedTvBloc {}

class TvDetailEventHelper extends Fake implements TvEvent {}

class TvDetailStateHelper extends Fake implements TvState {}

class TvDetailBlocHelper extends MockBloc<TvEvent, TvState>
    implements TvDetailBloc {}

class RecommendationTvEventHelper extends Fake implements TvEvent {}

class RecommendationTvStateHelper extends Fake implements TvState {}

class RecommendationTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements RecommendationsTvBloc {}

class WatchlistTvEventHelper extends Fake implements TvEvent {}

class WatchlistTvStateHelper extends Fake implements TvState {}

class WatchlistTvBlocHelper extends MockBloc<TvEvent, TvState>
    implements WatchlistTvBloc {}
