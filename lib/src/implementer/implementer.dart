/// Foundation class for implementing subtype from a base type.
/// Thought to be used on immutable types (like String, int, etc)
abstract class Implementer<T> {
  const Implementer(this.value);

  final T value;
  T call() => value;

  @override
  bool operator ==(other) =>
      runtimeType == other.runtimeType &&
      value == (other as Implementer).value;

  @override
  int get hashCode => '$runtimeType$value'.hashCode;
}
