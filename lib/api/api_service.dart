import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:take_home_pj/models/take_home_models/prices_response_model.dart';
import 'package:take_home_pj/utils/constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger());
    }
    return ApiService(dio);
  }

  static ApiService createOtherUrl(String url) {
    final dio = Dio();
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger());
    }
    return ApiService(dio, baseUrl: url);
  }

  // @GET('1/comments')
  // Future<HttpResponse> getSlots();

  // @GET(Constants.SLOTS_PATH)
  // Future<List<SlotsModel>> getSlots();

  @GET(Constants.SLOTS_PATH)
  Future<HttpResponse> getSlots();

  @GET(Constants.PRICE_PATH)
  Future<PricesResponseModel> getPrices();

// @GET(Constants.PRICE_PATH)
// Future<List<P>> getPrices();

}
