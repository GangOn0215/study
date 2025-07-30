/**
 * typedef 는 alias로 사용되는 타입을 정의하는데 사용됩니다.
 */

typedef IntList = List<int>;
typedef UserInfo = Map<String, String>;

IntList getEvenNumbers(IntList numbers) {
  return numbers.where((number) => number.isEven).toList();
}

String sayHello(UserInfo user) {
  return "Hello, ${user['name']}! You are ${user['age']} years old and live in ${user['city']}.";
}

void main() {
  IntList numbers = [1, 2, 3, 4, 5, 6];

  IntList evenNumbers = getEvenNumbers(numbers);

  print(evenNumbers); // [2, 4, 6]

  print(sayHello({'name': 'Jyunho', 'age': '25', 'city': 'Seoul'}));
}
