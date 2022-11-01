import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series/tv_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTv = Tv(
  backdropPath: "/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg",
  firstAirDate: "2022-08-21",
  genreIds: const [10765, 18, 10759],
  id: 94997,
  name: "House of the Dragon",
  originCountry: const ["US"],
  originalLanguage: "en",
  originalName: "House of the Dragon",
  overview:
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  popularity: 4774.722,
  posterPath: "/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg",
  voteAverage: 8.532,
  voteCount: 1794,
);

final testTvList = [testTv];

final testTvDetail = TvDetail(
  adult: false,
  backdropPath: "/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg",
  episodeRunTime: const [60],
  firstAirDate: DateTime(2022 - 08 - 21),
  genres: [
    Genre(id: 10765, name: "Sci-Fi & Fantasy"),
    Genre(id: 18, name: "Drama"),
    Genre(id: 10759, name: "Action & Adventure")
  ],
  homepage: "https://www.hbo.com/house-of-the-dragon",
  id: 94997,
  inProduction: false,
  languages: const ["en"],
  lastAirDate: DateTime(2022 - 10 - 16),
  name: "House of the Dragon",
  numberOfEpisodes: 10,
  numberOfSeasons: 1,
  originCountry: const ["US"],
  originalLanguage: "en",
  originalName: "House of the Dragon",
  overview:
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  popularity: 7531.531,
  posterPath: "/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg",
  status: "Returning Series",
  tagline: "Fire and blood.",
  type: "Scripted",
  voteAverage: 8.537,
  voteCount: 1842,
);

final testTvTable = TvTable(
  id: 94997,
  name: 'House of the Dragon',
  overview:
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  posterPath: '/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg',
);

final testTvMap = {
  'id': 94997,
  'name': 'House of the Dragon',
  'overview':
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  'posterPath': '/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg',
};

final testWatchlistTv = Tv.watchlist(
  id: 94997,
  name: 'House of the Dragon',
  overview:
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  posterPath: '/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg',
);
