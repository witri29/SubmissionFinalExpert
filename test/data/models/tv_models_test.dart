import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvModel = TvSeriesModel(
    firstAirDate: 'firstAirDate',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originCountry: ['originCountry'],
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTv = Tv(
    firstAirDate: 'firstAirDate',
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    originCountry: ['originCountry'],
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}
