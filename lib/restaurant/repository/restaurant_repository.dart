import 'package:actual/restaurant/model/restaurant_detail_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  // http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http://$i>p/restaurant/
  // @GET('/')
  // paginate();

  // http://$ip/restaurant/:id
  @GET('/{id}')
  @Headers({
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1bmdyeSIsInN1YiI6ImY1NWIzMmQyLTRkNjgtNGMxZS1hM2NhLWRhOWQ3ZDBkOTJlNSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2NzcwMjY3MDcsImV4cCI6MTY3NzAyNzAwN30.SALQAGi-4GE1q1lZeHcLvbAkBEYwU1x44AKHMP2Vf3M'
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
  });
}
