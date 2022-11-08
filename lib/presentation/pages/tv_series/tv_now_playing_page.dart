import 'package:ditonton/presentation/provider/bloc_tv_series/tv_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/tvNowPlaying';

  @override
  _NowPlayingTvPageState createState() => _NowPlayingTvPageState();
}

class _NowPlayingTvPageState extends State<NowPlayingTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TvNowPlayingBloc>().add(FetchNowplayingTv()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<TvNowPlayingBloc, TvState>(builder: (context, state) {
          if (state is TvLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.tvs[index];
                return TvCard(tv);
              },
              itemCount: state.tvs.length,
            );
          } else if (state is TvHasError) {
            return Center(
              key: const Key('error_message'),
              child: Text(state.message),
            );
          } else {
            return Text('Data is empty');
          }
        }),
      ),
    );
  }
}
