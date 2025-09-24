import 'package:flutter/material.dart';

class AppColors {
  // 기본 배경
  static const background = Color(0xFFF9FAFB); // 아주 밝은 회색 (거의 화이트)

  // 주요 포인트 컬러
  static const primary = Color(0xFF6C63FF); // 산뜻한 보라/블루 톤
  static const secondary = Color(0xFF4FD1C5); // 민트 계열로 포인트

  // 텍스트 컬러
  static const textPrimary = Color(0xFF2C2C2C); // 기본 진회색
  static const textSecondary = Color(0xFF6E6E6E); // 중간 회색
  static const textHint = Color(0xFF9E9E9E); // 힌트/비활성

  // 회색 계열 (UI 요소에 자주 쓰이는 단계별 그레이)
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const grey800 = Color(0xFF424242);
  static const grey900 = Color(0xFF212121);

  // 네비게이션 (아이콘/탭)
  static const navSelected = Color(0xFF4A90E2); // 산뜻한 블루
  static const navUnselected = Color(0xFF757575); // 중간 회색

  // 상태/알림 컬러
  static const success = Color(0xFF4CAF50); // 초록
  static const warning = Color(0xFFFFC107); // 노랑
  static const error = Color(0xFFF44336); // 빨강
  static const info = Color(0xFF2196F3); // 파랑

  // 버튼
  static const buttonPrimaryBg = primary;
  static const buttonPrimaryText = Colors.white;

  static const buttonSecondaryBg = grey200;
  static const buttonSecondaryText = textPrimary;

  static const buttonDisabledBg = grey300;
  static const buttonDisabledText = grey600;
}
