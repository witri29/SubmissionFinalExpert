import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_recomendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetTvRecommendations usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvRecommendations(mockTvRepository);
  });

  final tId = 1;
  final tTv = <Tv>[];

  test('should get list of movie recommendations from the repository',
          () async {
        // arrange
        when(mockTvRepository.getTvRecommendations(tId))
            .thenAnswer((_) async => Right(tTv));
        // act
        final result = await usecase.execute(tId);
        // assert
        expect(result, Right(tTv));
      });
}
