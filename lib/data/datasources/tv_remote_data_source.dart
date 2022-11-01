import 'dart:convert';

import 'package:ditonton/data/models/tv_series/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:ditonton/data/models/tv_series/tv_response.dart';
import 'package:ditonton/common/exception.dart';
import 'package:http/http.dart' as http;

abstract class TvRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTv();
  Future<List<TvSeriesModel>> getPopularTv();
  Future<List<TvSeriesModel>> getTopRatedTv();
  Future<TvDetailResponse> getTvDetail(int id);
  Future<List<TvSeriesModel>> getTvRecommendations(int id);
  Future<List<TvSeriesModel>> searchTv(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvSeriesModel>> getNowPlayingTv() async {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse
          .fromJson(json.decode(response.body))
          .tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getTvDetail(int id) async {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTvRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse
          .fromJson(json.decode(response.body))
          .tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getPopularTv() async {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse
          .fromJson(json.decode(response.body))
          .tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTv() async {
    final response =
    await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse
          .fromJson(json.decode(response.body))
          .tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> searchTv(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvResponse
          .fromJson(json.decode(response.body))
          .tvList;
    } else {
      throw ServerException();
    }
  }
}