import 'package:graphy/graphy.dart';

abstract class Detector {
  // controller는 아래 start 메소드가
  ScenarioController? controller;

  void start(ScenarioController controller);
}
