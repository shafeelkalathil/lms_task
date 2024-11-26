import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/error/api_exception.dart';
import '../../../core/network/dio_client.dart';
import '../model/module_video_model.dart';

final moduleVideoRepositoriesProvider = Provider((ref) => ModuleVideoRepositories(),);

class ModuleVideoRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Stream<List<ModuleVideoModel>> getAllVideoByModule({required int moduleId}) async* {
    try {

      /// Set headers
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      /// Make the API call
      final response = await _dioClient.dio.get('${ApiConstants.videoEndpoint}?module_id=$moduleId');

      /// Handle successful response
      if (response.statusCode == 200) {
        /// Decode JSON if response.data is a string
        final List<dynamic> responseData = response.data is String
            ? jsonDecode(response.data) as List<dynamic>
            : response.data as List<dynamic>;

        /// Map the list to SubjectModel
        final List<ModuleVideoModel> subjects = responseData
            .map((course) =>
            ModuleVideoModel.fromJson(course as Map<String, dynamic>))
            .toList();

        yield subjects;
      } else {
        throw _exceptionHandler.getErrorMessage(response.statusCode);
      }
    } on DioException catch (e) {
      throw _exceptionHandler.getExceptionMessage(e);
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }

}

