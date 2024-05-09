import 'dart:async';

/// Detector에 사용되는 Event Stream의 타입을 key로 subscription과 callback을 저장 및 관리
/// ex) AccelerometerEventStream
class SceneStreamManager {
  final Map<Type, StreamSubscription> _subscriptions = {};
  final Map<Type, List<Function>> _callbacks = {};

  void addSubscription(Type owner, Stream stream) {
    _subscriptions.putIfAbsent(
      owner,
      () => stream.listen(
        (event) {
          _callbacks[owner]?.forEach((callback) {
            // ignore: avoid_dynamic_calls
            callback(event);
          });
        },
      ),
    );
  }

  void addCallback(Type owner, Function callback) {
    _callbacks.putIfAbsent(
      owner,
      () => [],
    );

    _callbacks[owner]!.add(callback);
  }

  void dispose() {
    _subscriptions.forEach((_, subscription) {
      subscription.cancel();
    });
  }
}
