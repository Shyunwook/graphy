import 'package:graphy/src/detector/detector.dart';

abstract class GestureDetectorType extends Detector {
  String get recognizerType;
  String get recognizer;

  @override
  void start() {
    print(controller);
  }
}
