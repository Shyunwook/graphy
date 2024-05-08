import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/event/stream_manager/event_stream_manager.dart';
import 'package:graphy/src/detector/types/types.dart';

import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerDetector extends EventDetectorType<AccelerometerEvent> {
  @override
  void Function(AccelerometerEvent event) get callback => (event) {
        controller?.play(
          [AccelerometerEventAction(event)],
        );
      };

  @override
  EventStreamManager<AccelerometerEvent> get eventStreamManager =>
      AccelerometerEventStream();
}

class Test extends EventDetectorType<AccelerometerEvent> {
  @override
  // TODO: implement callback
  void Function(AccelerometerEvent event) get callback => (event) {};

  @override
  // TODO: implement eventStreamManager
  EventStreamManager<AccelerometerEvent> get eventStreamManager =>
      throw UnimplementedError();
}
