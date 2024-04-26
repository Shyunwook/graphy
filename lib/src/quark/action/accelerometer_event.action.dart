// ignore_for_file: override_on_non_overriding_member

import 'package:quark/core/combination.dart';
import 'package:quark/core/consumer.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart';

class AccelerometerEventAction extends ActionPlugin<AccelerometerEvent> {
  AccelerometerEventAction(super.value);

  @override
  Comparison compare(ActionPlugin<AccelerometerEvent> action) {
    final val = Vector3(value.x, value.y, value.z);
    final acVal = Vector3(action.value.x, action.value.y, action.value.z);

    return Comparison(
      value == action.value,
      (val - acVal).distanceTo(Vector3.zero()) > 0,
      (val - acVal).distanceTo(Vector3.zero()) < 0,
    );
  }

  @override
  AccelerometerEventAction minus(ActionPlugin<AccelerometerEvent> action) {
    final newVal = AccelerometerEvent(
      value.x - action.value.x,
      value.y - action.value.y,
      value.z - action.value.z,
    );

    return AccelerometerEventAction(newVal);
  }

  @override
  AccelerometerEventAction plus(ActionPlugin<AccelerometerEvent> action) {
    final newVal = AccelerometerEvent(
      value.x + action.value.x,
      value.y + action.value.y,
      value.z + action.value.z,
    );

    return AccelerometerEventAction(newVal);
  }
}
