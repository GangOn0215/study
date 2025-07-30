String sayHello({String name = '', int age = 0, String city = ''}) {
  return "Hello, $name! You are $age years old and live in $city.";
}

String sayRequired({required String name, required int age, String city = ''}) {
  return "Hello, $name! You are $age years old and live in $city.";
}

void main() {
  print(sayHello(name: 'Jyunho', age: 25, city: 'Seoul'));
  print(sayRequired(name: 'Jyunho', age: 25, city: 'Seoul'));
  sayHello();
  // sayRequired();
}
