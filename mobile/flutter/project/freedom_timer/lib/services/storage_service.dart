// lib/services/storage_service.dart

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // 저장할 때 사용할 키 이름
  static const String _tokenKey = 'auth_token';

  /// 토큰 저장
  Future<void> saveToken(String token) async {
    // 1. 저장소 열기
    final prefs = await SharedPreferences.getInstance();

    // 2. 'auth_token'이라는 이름으로 토큰 저장
    await prefs.setString(_tokenKey, token);
  }

  /// 토큰 가져오기
  Future<String?> getToken() async {
    // 1. 저장소 열기
    final prefs = await SharedPreferences.getInstance();

    // 2. 'auth_token' 이름으로 저장된 값 가져오기
    return prefs.getString(_tokenKey);
    // 없으면 null 반환
  }

  /// 토큰 삭제
  Future<void> removeToken() async {
    // 1. 저장소 열기
    final prefs = await SharedPreferences.getInstance();

    // 2. 'auth_token' 삭제
    await prefs.remove(_tokenKey);
  }

  /// 로그인 여부 확인
  Future<bool> isLoggedIn() async {
    // 토큰이 있으면 로그인된 것
    final token = await getToken();

    return token != null && token.isNotEmpty;
  }
}
