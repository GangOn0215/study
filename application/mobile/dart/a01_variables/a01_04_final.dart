void main() {
  String name = 'puppy';
  final fName = 'puppy';

  name = 'happy ' + name;
  // fName = 'happy ' + fName; // 수정 불가

  print(fName);
}
