import 'package:graphy/src/detector/detector.dart';
import 'package:graphy/src/detector/sensor/detection/detection.dart';
import 'package:graphy/src/scenario/scenario_controller.dart';

abstract class SensorDetectorType<T> extends Detector {
  void Function(T event) get callback;
  Detection<T> get detection;

  SensorDetectorType() {
    detection.addCallback(callback);
  }

  @override
  void start(ScenarioController controller) {
    this.controller = controller;

    detection.startDetecting();
  }
}
