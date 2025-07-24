void main() {
  String name = 'Dart';

  name = 'Changed Dart'; // name 변수는 재할당 가능

  print(name);

  final String finalName = 'Dart Final';

  // finalName = 'Changed Dart Final'; // 오류 발생: final 변수는 재할당 불가
  print(finalName);
}
