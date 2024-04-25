import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/types/gesture.detector_type.dart';

class GestureSign extends Sign<GestureDetectorType> {
  GestureSign._({required super.detector, required super.module});

  factory GestureSign.dragHorizontal({double? min, double? max}) {
    print('sdfsdfsdf');
    return GestureSign._(
      detector: DragGestureDetector(),
      module: DragHorizontalModule(
        min: min,
        max: max,
      ),
    );
  }
}
