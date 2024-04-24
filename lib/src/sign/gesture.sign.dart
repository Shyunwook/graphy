import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/gesture/drag_gesture_detector.dart';
import 'package:graphy/src/detector/types/gesture.detector_type.dart';

class GestureSign extends Sign<GestureDetectorType> {
  GestureSign._({required super.detector, required super.module});

  factory GestureSign.dragRight() {
    return GestureSign._(
      detector: DragGestureDetector(),
      module: DragHorizontalModule(),
    );
  }
}
