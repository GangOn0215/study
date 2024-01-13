void main() {
  dynamic name;

  if (name is String) {
    name.isEmpty; // string method
  }

  if (name is int) {
    name.isEven; // int method
  }
}
