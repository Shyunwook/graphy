import 'package:graphy/src/detector/detector.dart';
import 'package:quark/core/module.dart';

abstract class Sign<T extends Detector> {
  final Module module;
  final T detector;

  Sign({
    required this.module,
    required this.detector,
  });
}
