abstract class Detection<T> {
  Map<int, void Function(T)> callbacks = {};

  /// Scenario generator에서 Scenario가 생성될 때 실행되는 메소드
  void startDetecting();
  void dispose();

  void addCallback(Function(T event) callback) {
    callbacks.putIfAbsent(callback.hashCode, () => callback);
  }
}
