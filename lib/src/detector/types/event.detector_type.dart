import 'package:graphy/src/detector/detector.dart';
import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:graphy/src/scenario/scenario_controller.dart';

abstract class EventDetectorType<T> extends Detector {
  void Function(T event) get callback;
  EventStreamManager<T> get eventStreamManager;

  @override
  void start(ScenarioController controller) {
    super.controller = controller;

    // eventStreamManager는 getter이기 때문에 인스턴스를 반복적으로 만들지 않도록 유의
    final EventStreamManager<T> manager = eventStreamManager;

    manager.initialize(controller);

    // EventStreamManager의 runtimeType을 기준으로 callback과
    // callback을 실행할 stream이 결정된다
    manager.addCallback(eventStreamManager.runtimeType, callback);
    manager.startStream(eventStreamManager.runtimeType);
  }
}
