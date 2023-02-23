import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  // http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http://$ip/restaurant/
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RestaurantModel>> paginate();

  // http://$ip/restaurant/:id
  // 일정 시간이 지나면 토큰값이 변경되므로 Postman에서 발급받아 변경 후 테스트 한다.
  // 그리고 flutter pub run build_runner build로 다시 빌드해야 retrofit으로 생성한
  // restaurant_repository.g.dart 내부에 authorization 값도 같이 갱신되어서 테스트 가능
  @GET('/{id}')
  @Headers({
    'accessToken': 'true',
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
  });
}
