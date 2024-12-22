import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String api,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(AppConstants.baseUrl + api,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true));
  }

  Future<Response> postData(String api,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(AppConstants.baseUrl + api,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }
}
