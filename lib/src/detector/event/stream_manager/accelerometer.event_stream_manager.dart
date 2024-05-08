import 'dart:async';

import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerEventStream extends EventStreamManager<AccelerometerEvent> {
  static final AccelerometerEventStream instance =
      AccelerometerEventStream._internal();

  factory AccelerometerEventStream() => instance;

  AccelerometerEventStream._internal();

  @override
  Stream<AccelerometerEvent> get stream => accelerometerEventStream(
        samplingPeriod: const Duration(
          milliseconds: 80,
        ),
      );
}
