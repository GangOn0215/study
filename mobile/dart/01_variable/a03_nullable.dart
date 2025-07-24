bool isEmpty(String string) {
  return string.length == 0;
}

void main() {
  // isEmpty(null.length); // 오류 발생: null 객체에 접근하려고 함

  String name = 'Dart';

  // name = null;
  print(name);

  String? nullableName = null; // nullableName은 null을 허용함
  nullableName = 'Dart Nullable'; // null이 아닌 값으로 변경 가능

  print(nullableName);
}
