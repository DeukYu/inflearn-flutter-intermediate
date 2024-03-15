import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/model/restraurant_detail_model.dart';
import 'package:actual/restaurant/model/restraurant_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'restaurant_repository.g.dart';

@retrofit.RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  @retrofit.GET('/')
  @retrofit.Headers({'accessToken': 'true'})
  Future<CursorPagination<RestaurantModel>> paginate();

  @retrofit.GET('/{id}')
  @retrofit.Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @retrofit.Path() required String id,
  });
}
