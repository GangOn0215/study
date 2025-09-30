import 'package:dio/dio.dart';

class BaseApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://soft41500.store/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  /// 응답 처리 헬퍼 메서드
  T handleResponse<T>(Response response, T Function(dynamic data) parser) {
    print('🔍 handleResponse - statusCode: ${response.statusCode}');
    print('🔍 handleResponse - data: ${response.data}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        return parser(response.data);
      } catch (e) {
        print('❌ parser 에러: $e');
        throw Exception('데이터 파싱 실패: $e');
      }
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.data}');
    }
  }

  /// 에러 메시지 추출
  String getErrorMessage(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return error.response?.data['message'] ?? error.message ?? '알 수 없는 에러';
      }
      return error.message ?? '네트워크 에러';
    }
    return error.toString();
  }
}
