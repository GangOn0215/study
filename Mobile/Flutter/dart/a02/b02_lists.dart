void main() {
  bool giveMeFive = true;

  List<int> numbers = [
    1,
    2,
    3,
    4,
    // collection if
    if (giveMeFive) 5,
  ];

  print(numbers);
}
