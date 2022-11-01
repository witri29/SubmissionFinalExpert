import 'dart:convert';

import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/data/models/tv_series/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvModel = TvSeriesModel(
    backdropPath: "backdropPath",
    firstAirDate: "2022-08-21",
    genreIds: [1, 2, 3],
    id: 1,
    name: "name",
    originCountry: ["1", "2", "3"],
    originalLanguage: "originalLanguage",
    originalName: "originalName",
    overview: "overview",
    popularity: 1,
    posterPath: "posterPath",
    voteAverage: 1,
    voteCount: 1,
  );
  final tTvResponseModel =
      TvResponse(tvList: <TvSeriesModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series/tv_now_playing.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        'results': [
          {
            "backdrop_path": "backdropPath",
            "first_air_date": "2022-08-21",
            "genre_ids": [1, 2, 3],
            "id": 1,
            "name": "name",
            "origin_country": ["1", "2", "3"],
            "original_language": "originalLanguage",
            "original_name": "originalName",
            "overview": "overview",
            "popularity": 1,
            "poster_path": "posterPath",
            "vote_average": 1,
            "vote_count": 1
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
