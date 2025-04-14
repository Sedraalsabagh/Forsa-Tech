import 'package:devloper_app/constants/String.dart';
import 'package:devloper_app/data/models/resumemodel.dart';
import 'package:dio/dio.dart';

class CVWebServices {
  late final Dio dio;

  CVWebServices()
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

  Future<Map<String, dynamic>> createResume1(ResumeModel resume) async {
    try {
      final response = await dio.post(
        "/resumes/",
        data: resume.toJson(),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': response.data['message'],
          'data': response.data['data'],
        };
      } else {
        return {
          'success': false,
          'message': "Unexpected status code: ${response.statusCode}",
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? e.message,
        'error': e.toString(),
      };
    }
  }
}
