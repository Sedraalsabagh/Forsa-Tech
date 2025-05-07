import 'package:devloper_app/data/models/complaint.dart';
import 'package:dio/dio.dart';

class ComplaintWebService {
  final Dio _dio;
  String? _accessToken;

  ComplaintWebService({required String? accessToken})
      : _accessToken = accessToken,
        _dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:8000/auth',
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            headers: {
              'Content-Type': 'application/json',
              if (accessToken != null) 'Authorization': 'Bearer $accessToken',
            },
          ),
        );

  void updateToken(String newToken) {
    _accessToken = newToken;
    _dio.options.headers['Authorization'] = 'Bearer $newToken';
  }

  Future<void> postComplaint(Complaint complaint) async {
    try {
      final response = await _dio.post(
        '/complaints/',
        data: complaint.toJson(),
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw Exception('Failed to submit complaint: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Session has expired, You must be logged in');
      } else {
        throw Exception('Failed to send message: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}