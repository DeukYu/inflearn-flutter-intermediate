import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/common/model/pagination_params.dart';
import 'package:actual/rating/model/rating_model.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

abstract class IBasePaginationRepository<T> {
  Future<CursorPagination<RatingModel>> paginate({
    @retrofit.Queries() PaginationParams? paginationParams,
  });
}
