import 'dart:async';

abstract class EventStreamManager<T> {
  final Map<int, void Function(T)> _callbacks = {};

  StreamSubscription<T>? _subscription;

  /// Scenario generator에서 Scenario가 생성될 때 실행되는 메소드
  void startStream() {
    _subscription ??= stream.listen(
      (event) {
        _callbacks.forEach((key, callback) {
          callback(event);
        });
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _callbacks.clear();
  }

  void addCallback(Function(T event) callback) {
    _callbacks.putIfAbsent(callback.hashCode, () => callback);
  }

  Stream<T> get stream;
}
