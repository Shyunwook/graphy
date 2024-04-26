import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/sensor/detection/detection.dart';
import 'package:graphy/src/detector/types/sensor.detector_type.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerDetector extends SensorDetectorType<AccelerometerEvent> {
  @override
  void Function(AccelerometerEvent event) get callback => (event) {
        controller.quark.play(
          [AccelerometerEventAction(event)],
        );
      };

  @override
  Detection<AccelerometerEvent> get detection => AccelerometerDetection();
}
