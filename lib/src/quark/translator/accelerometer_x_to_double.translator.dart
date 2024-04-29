import 'package:graphy/graphy.dart';
import 'package:graphy/src/quark/behavior/double.behavior.dart';
import 'package:quark/muabe_quark.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerXToDoubleTranslator
    extends Translator<AccelerometerEventAction, DoubleBehavior> {
  @override
  AccelerometerEventAction? reversedTranslate(
      String actionID, DoubleBehavior behavior) {
    if (behavior.infinity) {
      return null;
    }

    return AccelerometerEventAction(AccelerometerEvent(behavior.value, 0, 0));
  }

  @override
  DoubleBehavior translate(
      AccelerometerEventAction action,
      AccelerometerEventAction? minAction,
      AccelerometerEventAction? maxAction) {
    return DoubleBehavior(action.value.x);
  }
}
