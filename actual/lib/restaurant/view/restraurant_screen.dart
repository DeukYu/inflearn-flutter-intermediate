import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/component/restraurant_card.dart';
import 'package:actual/restaurant/provider/restraurant_provider.dart';
import 'package:actual/restaurant/view/restraurant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if (data is CursorPaginationLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final cp = data as CursorPagination;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemCount: cp.data.length,
        itemBuilder: (_, index) {
          final pItem = cp.data[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                          id: pItem.id,
                        )));
              },
              child: RestaurantCard.fromModel(model: pItem));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 16.0,
          );
        },
      ),
      /*,*/
    );
  }
}
