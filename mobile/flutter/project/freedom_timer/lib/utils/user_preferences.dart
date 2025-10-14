import 'dart:convert';

import 'package:freedom_timer/models/kakao_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // 저장할 때 사용할 키 이름
  static const String _keyUser = 'kakao_user';

  static Future<void> saveUser(KakaoUser user) async {
    // 1. SharedPreferences 인스턴스 가져오기
    final prefs = await SharedPreferences.getInstance();

    final userMap = user.toJson();

    final userJson = jsonEncode(userMap);

    await prefs.setString(_keyUser, userJson);

    print('save user information');
  }

  static Future<KakaoUser?> loadUser() async {
    /// 1. SharedPreferences에서 문자열 가져오기
    /// 2. 문자열 → JSON (Map)으로 변환
    /// 3. JSON → KakaoUser 객체로 변환
    /// 4. 반환
    ///

    // 1. SharedPreferences 인스턴스 가져오기
    final prefs = await SharedPreferences.getInstance();

    var userJson = prefs.getString(_keyUser);

    // 3. 저장된 데이터가 없으면?
    if (userJson == null) {
      // null 체크!
      print('❌ 저장된 사용자 정보 없음');
      return null; // null 반환
    }

    // 문자열 + JSON ( MAP )
    Map<String, dynamic> userMap = jsonDecode(userJson);

    print(userJson);
    print(userMap);

    final user = KakaoUser.fromJson(userMap);

    return user;
  }

  static Future<void> removeUser() async {
    // 1. SharedPreferences 인스턴스 가져오기
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(_keyUser);

    print('사용자 정보 삭제 완료');
  }
}
