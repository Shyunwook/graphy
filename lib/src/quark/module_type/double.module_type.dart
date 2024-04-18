import 'package:graphy/src/quark/behavior/double.behavior.dart';
import 'package:quark/core/module.dart';

class DoubleModuleType extends ModuleType<DoubleBehavior> {
  DoubleModuleType() : super();

  @override
  double priority(
    DoubleBehavior minBehavior,
    DoubleBehavior maxBehavior,
    DoubleBehavior currentBehavior,
  ) {
    return (currentBehavior.value - minBehavior.value) /
        (maxBehavior.value - minBehavior.value);
  }
}
