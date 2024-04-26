import 'package:graphy/graphy.dart';
import 'package:graphy/src/collector/collector.dart';
import 'package:graphy/src/collector/collector_manager.dart';
import 'package:graphy/src/detector.dart';
import 'package:graphy/src/detector/detector.dart';

class Detectors extends Collector<Detector>
    with CollectorManager<Detectors, Detector> {
  @override
  Detectors addCollection(Detector value) {
    add(value);

    return this;
  }
}

extension DetectorsExtensions on Detectors {
  // Gesture
  Detectors dragGesture() => addCollection(
        DragGestureDetector(),
      );

  // Sensor
  Detectors accelerometer() => addCollection(
        AccelerometerDetector(),
      );
}
