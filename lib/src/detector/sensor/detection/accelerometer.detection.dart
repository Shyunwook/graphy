import 'dart:async';

import 'package:graphy/src/detector/sensor/detection/detection.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerDetection extends Detection<AccelerometerEvent> {
  static final AccelerometerDetection instance =
      AccelerometerDetection._internal();

  factory AccelerometerDetection() => instance;

  AccelerometerDetection._internal();

  bool _initialized = false;

  StreamSubscription<AccelerometerEvent>? subscription;
  Stream<AccelerometerEvent> listener = accelerometerEventStream(
    samplingPeriod: const Duration(
      milliseconds: 80,
    ),
  );

  @override
  void startDetecting() {
    if (!_initialized) {
      _initialized = true;
      subscription = listener.listen(
        (event) {
          callbacks.forEach((key, callback) {
            callback(event);
          });
        },
      );
    }
  }

  @override
  void dispose() {
    subscription?.cancel();
    callbacks.clear();
    _initialized = false;
  }
}
