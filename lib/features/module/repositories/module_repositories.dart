import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/error/api_exception.dart';
import '../../../core/network/dio_client.dart';
import '../model/module_model.dart';

final moduleRepositoriesProvider = Provider((ref) => ModuleRepositories(),);

class ModuleRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Stream<List<ModuleModel>> getAllModulesBySubject({required int subjectId}) async* {
    try {
      /// Set headers
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      /// Make the API call
      final response = await _dioClient.dio.get('${ApiConstants.moduleEndpoint}?subject_id=$subjectId');

      /// Handle successful response
      if (response.statusCode == 200) {
        /// Decode JSON if response.data is a string
        final List<dynamic> responseData = response.data is String
            ? jsonDecode(response.data) as List<dynamic>
            : response.data as List<dynamic>;

        /// Map the list to SubjectModel
        final List<ModuleModel> subjects = responseData
            .map((course) =>
            ModuleModel.fromJson(course as Map<String, dynamic>))
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

