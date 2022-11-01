import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTv])
void main() {
  late TvSearchNotifier provider;
  late MockSearchMoviesTv mockSearchMoviesTv;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchMoviesTv = MockSearchMoviesTv();
    provider = TvSearchNotifier(searchTv: mockSearchMoviesTv)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTvModel = Tv(
    firstAirDate: "2022-08-21",
    originalLanguage: "en",
    backdropPath: "/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg",
    genreIds: const [10765, 18, 10759],
    id: 94997,
    originalName: "House of the Dragon",
    overview:
        "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
    popularity: 4774.722,
    posterPath: "/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg",
    originCountry: ["US"],
    name: "House of the Dragon",
    voteAverage: 8.532,
    voteCount: 1794,
  );
  final tTvList = <Tv>[tTvModel];
  final tQuery = 'gameofthrones';

  group('search movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMoviesTv.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchMoviesTv.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchMoviesTv.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
