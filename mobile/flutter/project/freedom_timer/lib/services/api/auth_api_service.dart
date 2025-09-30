import 'package:freedom_timer/services/api/base_api_service.dart';
import 'package:freedom_timer/services/storage_service.dart';

class AuthApiService extends BaseApiService {
  // ↑ BaseApiService를 상속받음
  // = dio, handleResponse, getErrorMessage 등을 그대로 사용 가능!

  final StorageService _storageService = StorageService();

  /// 카카오 로그인 URL 가져오기
  Future<String> getKakaoLoginUrl() async {
    try {
      // 1. 서버에 요청
      final response = await dio.get('/kakao/login');

      // 2. 응답 처리
      return handleResponse(response, (data) => data['login_url'] as String);
    } catch (e) {
      throw Exception('로그인 URL 가져오기 실패: ${getErrorMessage(e)}');
    }
  }

  /// 카카오 콜백 처리
  Future<Map<String, dynamic>> kakaoCallback(String code) async {
    try {
      final response = await dio.get(
        '/kakao/callback',
        queryParameters: {'code': code},
      );

      return handleResponse(response, (data) {
        // 토큰 저장
        _storageService.saveToken(data['token']);
        return data['member'] as Map<String, dynamic>;
      });
    } catch (e) {
      throw Exception('카카오 로그인 실패: ${getErrorMessage(e)}');
    }
  }

  /// 로그아웃
  Future<void> logout() async {
    try {
      await dio.post('/kakao/logout');
    } catch (e) {
      print('로그아웃 API 실패: $e');
    } finally {
      await _storageService.removeToken();
    }
  }

  /// 로그인 여부 확인
  Future<bool> isLoggedIn() async {
    return await _storageService.isLoggedIn();
  }
}
