class Human {
  final String name;

  Human({required this.name});

  void sayHello() {
    print("Hi My Name is $name");
  }
}

enum Team { blue, red }

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name,
  }) : super(name: name);

  @override
  void sayHello() {
    super.sayHello();

    print("and I play for ${team}");
  }
}
