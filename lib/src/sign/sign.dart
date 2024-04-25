import 'package:graphy/src/detector/detector.dart';
import 'package:quark/core/module.dart';

abstract class Sign<T extends Detector> {
  final T detector;
  final Module module;

  Sign({
    required this.detector,
    required this.module,
  });
}
