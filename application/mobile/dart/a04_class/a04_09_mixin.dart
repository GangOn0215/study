enum Team { red, blue, orange, yellow }

mixin Strong {
  double strenghtLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print('ruuuuuuuuuuuuuuuun!');
  }
}

class Human {
  final String name;

  Human({required this.name});

  void sayHello() {
    print("Hi my name is ${this.name}");
  }
}

class Player with Strong, QuickRunner {
  late Team team;

  Player({
    required Team team,
    required String name,
  });
}

void main() {}
