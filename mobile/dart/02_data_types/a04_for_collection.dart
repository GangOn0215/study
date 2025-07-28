void main() {
  List<String> oldFruits = [
    'Tomato',
    'Potato',
  ];
  List<String> newFruits = [
    'Apple',
    'Banana',
    'Cherry',
    for (var fruit in oldFruits)
      "🥕 $fruit",
  ];

  print(newFruits);
}
