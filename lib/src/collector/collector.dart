abstract class Collector<T> {
  final List<T> _collections = [];
  List<T> get() => _collections;

  void add(T value) {
    _collections.add(value);
  }
}
