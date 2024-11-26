import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required this.dio,
    this.excludedPaths = const [],
  });

  final Dio dio;
  final List<String> excludedPaths;
}
