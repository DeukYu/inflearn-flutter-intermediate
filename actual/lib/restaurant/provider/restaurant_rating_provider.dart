import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/rating/model/rating_model.dart';
import 'package:actual/restaurant/repository/restaurant_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final restaurantRatingProvider =
//     Provider.family<RatingModel?, String>((ref, id) {
//   final state = ref.watch(restaurantRatingProvider);

//   if (state is! CursorPagination) {
//     return null;
//   }
//   return state.data.firstWhere((element) => element.id == id);
// });

class RestaurantRatingStateNotifier
    extends StateNotifier<CursorPaginationBase> {
  final RestaurantRatingRepository repository;
  RestaurantRatingStateNotifier({required this.repository})
      : super(
          CursorPaginationLoading(),
        ) {}
}
