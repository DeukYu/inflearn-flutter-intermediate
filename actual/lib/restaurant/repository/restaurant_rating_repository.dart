import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/model/pagination_params.dart';
import 'package:actual/rating/model/rating_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'restaurant_rating_repository.g.dart';

final restaurantRatingRepositoryProvider =
    Provider.family<RestaurantRatingRepository, String>((ref, id) {
  final dio = ref.watch(dioProvider);

  final repository = RestaurantRatingRepository(dio,
      baseUrl: 'http://$ip/restaurant/$id/rating');

  return repository;
});

@retrofit.RestApi()
abstract class RestaurantRatingRepository {
  factory RestaurantRatingRepository(Dio dio, {String baseUrl}) =
      _RestaurantRatingRepository;

  @retrofit.GET('/')
  @retrofit.Headers({'accessToken': 'true'})
  Future<CursorPagination<RatingModel>> paginate({
    @retrofit.Queries() PaginationParams? paginationParams,
  });

  @retrofit.GET('/{id}/rating')
  @retrofit.Headers({'accessToken': 'true'})
  Future<RatingModel> getRestaurantRating({
    @retrofit.Path() required String id,
  });
}
