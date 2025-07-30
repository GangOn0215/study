String sayHello(String name) {
  return "Hello, $name!";
}

String sayHelloTo(String name, String greeting) => "$greeting, $name!";

void main() {
  print(sayHello('Jyunho'));
  print(sayHelloTo('Jyunho', 'Good morning'));
}
