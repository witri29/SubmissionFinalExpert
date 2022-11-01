import 'package:ditonton/data/models/tv_series/tv_model.dart';
import 'package:equatable/equatable.dart';

class TvResponse extends Equatable {
  final List<TvSeriesModel> tvList;

  TvResponse({required this.tvList});

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
    tvList: List<TvSeriesModel>.from((json["results"] as List)
        .map((x) => TvSeriesModel.fromJson(x))
        .where((element) => element.posterPath != null)),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(tvList.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [tvList];
}