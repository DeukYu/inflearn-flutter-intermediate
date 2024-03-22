import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/provider/pagination_provider.dart';
import 'package:actual/rating/model/rating_model.dart';
import 'package:actual/restaurant/repository/restaurant_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantRatingProvider = StateNotifierProvider.family<
    RestaurantRatingStateNotifier, CursorPaginationBase, String>(
  (ref, id) {
    final repository = ref.watch(restaurantRatingRepositoryProvider(id));

    final notifier = RestaurantRatingStateNotifier(repository: repository);

    return notifier;
  },
);

class RestaurantRatingStateNotifier
    extends PaginationProvider<RatingModel, RestaurantRatingRepository> {
  RestaurantRatingStateNotifier({
    required super.repository,
  });

  void getRating({
    required String id,
  }) async {
    if (state is! CursorPagination) {
      await paginate();
    }

    if (state is! CursorPagination) {
      return;
    }

    final pState = state as CursorPagination<RatingModel>;

    final res = await repository.getRestaurantRating(id: id);

    state = pState.copyWith(
        data:
            pState.data.map<RatingModel>((e) => e.id == id ? res : e).toList());
  }
}
