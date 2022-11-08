import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_now_playing_page.dart';
import 'package:ditonton/presentation/provider/bloc_tv_series/tv_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvHomePage extends StatefulWidget {
  static const ROUTE_NAME = '/tvHome';
  @override
  _TvHomePageState createState() => _TvHomePageState();
}

class _TvHomePageState extends State<TvHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvNowPlayingBloc>().add(FetchNowplayingTv());
      context.read<PopularTvBloc>().add(FetchPopularTv());
      context.read<TopRatedTvBloc>().add(FetchTopRatedTv());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Now Playing TV',
                onTap: () =>
                    Navigator.pushNamed(context, NowPlayingTvPage.ROUTE_NAME),
              ),
              BlocBuilder<TvNowPlayingBloc, TvState>(builder: (context, state) {
                if (state is TvLoading) {
                  return CircularProgressIndicator();
                } else if (state is TvHasData) {
                  return Tvlist(state.tvs);
                } else if (state is TvHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Text('Data is empty');
                }
              }),
              _buildSubHeading(
                title: 'Popular TV',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTvBloc, TvState>(builder: (context, state) {
                if (state is TvLoading) {
                  return CircularProgressIndicator();
                } else if (state is TvHasData) {
                  return Tvlist(state.tvs);
                } else if (state is TvHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Text('Data is empty');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated TV',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedTvBloc, TvState>(builder: (context, state) {
                if (state is TvLoading) {
                  return CircularProgressIndicator();
                } else if (state is TvHasData) {
                  return Tvlist(state.tvs);
                } else if (state is TvHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Text('Data is empty');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class Tvlist extends StatelessWidget {
  final List<Tv> movies;

  Tvlist(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
