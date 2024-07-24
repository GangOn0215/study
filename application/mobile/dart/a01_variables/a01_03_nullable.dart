bool isEmpty(String string) => string.length == 0;

void main() {
  // print(isEmpty(null)); // ERROR
  print(isEmpty('123'));

  // ? 가 붙는다는건 null이 될수도 있다는 뜻
  String? nico = 'nico';

  nico = null;

  // ignore: unnecessary_null_comparison
  if (nico != null) {
    nico.isNotEmpty;
  }
}
