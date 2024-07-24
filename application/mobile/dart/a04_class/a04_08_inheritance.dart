enum Team { red, blue, orange, yellow }

class Human {
  final String name;

  Human({required this.name});

  void sayHello() {
    print("Hi my name is ${this.name}");
  }
}

class Player extends Human {
  late Team team;

  Player({
    required Team team,
    required String name,
  }) : super(name: name);

  void sayMyTeam() {
    print('My team is ${this.team}');
  }
}

void main() {
  var player1 = Player(
    team: Team.orange,
    name: 'puppy',
  );

  player1.sayHello();
}
