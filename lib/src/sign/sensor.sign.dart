import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/types/sensor.detector_type.dart';

class SensorSign extends Sign<SensorDetectorType> {
  SensorSign._({required super.detector, required super.module});

  factory SensorSign.accelerometerX({double? min, double? max}) {
    return SensorSign._(
      detector: AccelerometerDetector(),
      module: AccelerometerXModule(
        min: min,
        max: max,
      ),
    );
  }
}
