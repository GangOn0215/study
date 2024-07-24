String sayHello(String name) {
  return "Hello $name nice to meet you";
}

// fat arrow syntax
String fatFunction(String name) => "Hello $name nice  to meet you";
num plus(num a, num b) => a + b;

void main() {
  print(sayHello('bronze'));

  print(plus(1, 2));
}
