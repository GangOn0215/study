void main() {
  String name;
  name = 'Dart Late';
  print(name);

  final String finalName;

  finalName = 'Dart Final Late'; // << 원래 에러 나야함. final 데이터는 한번 초기화 하면 수정 불가.

  print(finalName);

  late final String lateFinalName;
  lateFinalName = 'Dart Late Final'; // << late 키워드를 사용하면 나중에 초기화 가능

  print(lateFinalName);
}
