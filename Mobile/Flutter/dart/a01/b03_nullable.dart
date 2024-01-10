void main() {
  String coxe = 'coxe';
  String? nullableCoxe = 'coxe';

  // coxe = null; // error
  nullableCoxe = null;
  nullableCoxe?.isNotEmpty; // << ?. : null이 아닐때 만 isNotEmpty를 사용

  print(coxe);
}
