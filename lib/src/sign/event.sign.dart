import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/types/event.detector_type.dart';

class EventSign extends Sign<EventDetectorType> {
  EventSign._({required super.detector, required super.module});

  factory EventSign.accelerometerX({double? min, double? max}) {
    return EventSign._(
      detector: AccelerometerDetector(),
      module: AccelerometerXModule(
        min: min,
        max: max,
      ),
    );
  }
}
