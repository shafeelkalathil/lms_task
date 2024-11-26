import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lms_task/core/network/token_interceptor.dart';
import '../constants/api_constants.dart';

@lazySingleton
class DioClient {
  DioClient() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.add(
      TokenInterceptor(dio: dio, excludedPaths: excludedPaths),
    );
  }
  late Dio dio;
  // add paths to exclude token
  List<String> excludedPaths = [];
}
