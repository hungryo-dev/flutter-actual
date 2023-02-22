import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  // http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http://$ip/restaurant/
  // @GET('/')
  // paginate();

  // http://$ip/restaurant/:id
  // 일정 시간이 지나면 토큰값이 변경되므로 Postman에서 발급받아 변경 후 테스트 한다.
  // 그리고 flutter pub run build_runner build로 다시 빌드해야 retrofit으로 생성한
  // restaurant_repository.g.dart 내부에 authorization 값도 같이 갱신되어서 테스트 가능
  @GET('/{id}')
  @Headers({
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1bmdyeSIsInN1YiI6ImY1NWIzMmQyLTRkNjgtNGMxZS1hM2NhLWRhOWQ3ZDBkOTJlNSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2NzcwNDcwODAsImV4cCI6MTY3NzA0NzM4MH0.-NN4BEbxt8jUICTFFDGzCquWdfbRi8Eni727O57txgI'
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
  });
}
