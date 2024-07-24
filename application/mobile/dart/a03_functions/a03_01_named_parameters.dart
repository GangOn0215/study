String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello my name is $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(age: 29, name: 'puppy', country: 'Korea'));
}
