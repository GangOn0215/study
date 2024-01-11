abstract class Human {
  void walk();
}

enum Team { red, blue }

class Player extends Human {
  final String name;
  int xp, age;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.age,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is ${this.name}, my Team is ${this.team}");
  }

  @override
  void walk() {
    print('I\' work');
  }
}

class Coach extends Human {
  @override
  void walk() {
    print('the coach is walking');
  }
}

void main() {
  var player = Player(
    name: 'coxe',
    age: 29,
    team: Team.blue,
    xp: 0,
  );

  player.sayHello();
}
