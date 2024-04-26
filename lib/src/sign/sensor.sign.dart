import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/sensor/detection/detection.dart';
import 'package:graphy/src/detector/types/sensor.detector_type.dart';

// TODO DEMO 코드
class SensorSign extends Sign<SensorDetectorType> {
  SensorSign._({required super.detector, required super.module});

  factory SensorSign.accelerometerX({double? min, double? max}) {
    return SensorSign._(
      detector: DemoSensorDetector(),
      module: DragHorizontalModule(
        min: min,
        max: max,
      ),
    );
  }
}

class DemoSensorDetector extends SensorDetectorType<int> {
  @override
  void Function(int p1) get callback => throw UnimplementedError();

  @override
  Detection<int> get detection => throw UnimplementedError();

  @override
  void start(ScenarioController controller) {
    // detection.start();
  }
}
