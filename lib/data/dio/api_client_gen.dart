import 'package:dio/dio.dart';
import 'package:my_app/models/models_gen.dart';
import 'package:retrofit/retrofit.dart';

import 'api_service.dart';


part 'api_client_gen.g.dart';

/// https://pub.dev/packages/retrofit

@RestApi(baseUrl: ApiService.apiDomain)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // ----------- VIDEO -----------
  @GET('user')
  Future<User> getUser();

}