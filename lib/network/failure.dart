// A Wrapper Class for errors.
class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}
