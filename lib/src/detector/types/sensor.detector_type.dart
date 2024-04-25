import 'package:graphy/graphy.dart';

// TODO 예시 코드 작성 - 이런식으로 동작할거다
abstract class SensorDetectorType<T> extends Detector {
  void Function(T) get callback;
  Detection<T> get detection;
}

class Detection<T> {}
