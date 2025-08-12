// 클래스에서 변수는 반드시 자료형을 적어줘야함
class Player {
  late final String name;
  late final int xp;

  Player({required String name, required int xp}) {
    this.name = name;
    this.xp = xp;
  }

  sayHello() {
    print("Hello, $name!");
  }
}

void main() {
  Player player = Player(name: 'Jhyunho', xp: 1000);
  player.sayHello();

  player.name = 'BOBO';
  player.sayHello();
}
