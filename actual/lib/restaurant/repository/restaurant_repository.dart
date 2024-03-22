import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/model/pagination_params.dart';
import 'package:actual/common/repository/base_pagination_repository.dart';
import 'package:actual/restaurant/model/restraurant_detail_model.dart';
import 'package:actual/restaurant/model/restraurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);

  final repository =
      RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');

  return repository;
});

@retrofit.RestApi()
abstract class RestaurantRepository
    implements IBasePaginationRepository<RestaurantModel> {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  @retrofit.GET('/')
  @retrofit.Headers({'accessToken': 'true'})
  @override
  Future<CursorPagination<RestaurantModel>> paginate({
    @retrofit.Queries() PaginationParams? paginationParams,
  });

  @retrofit.GET('/{id}')
  @retrofit.Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @retrofit.Path() required String id,
  });
}
