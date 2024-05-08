import 'package:graphy/src/detector/detector.dart';
import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:graphy/src/scenario/scenario_controller.dart';

abstract class EventDetectorType<T> extends Detector {
  void Function(T event) get callback;
  EventStreamManager<T> get eventStreamManager;

  EventDetectorType() {
    eventStreamManager.addCallback(callback);
  }

  @override
  void start(ScenarioController controller) {
    this.controller = controller;

    eventStreamManager.startStream();
  }
}
