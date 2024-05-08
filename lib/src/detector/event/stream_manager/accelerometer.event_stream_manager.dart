import 'dart:async';

import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerEventStream extends EventStreamManager<AccelerometerEvent> {
  @override
  Stream<AccelerometerEvent> get stream => accelerometerEventStream(
        samplingPeriod: const Duration(
          milliseconds: 80,
        ),
      );
}
