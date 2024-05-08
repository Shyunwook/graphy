import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:graphy/src/detector/types/types.dart';

import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerDetector extends EventDetectorType<AccelerometerEvent> {
  @override
  void Function(AccelerometerEvent event) get callback => (event) {
        controller.play(
          [AccelerometerEventAction(event)],
        );
      };

  @override
  EventStreamManager<AccelerometerEvent> get eventStreamManager =>
      AccelerometerEventStream();
}
