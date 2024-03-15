import 'package:actual/restaurant/model/restraurant_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'restaurant_repository.g.dart';

@retrofit.RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // @GET('/')
  // paginate();

  @retrofit.GET('/{id}')
  @retrofit.Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @retrofit.Path() required String id,
  });
}
