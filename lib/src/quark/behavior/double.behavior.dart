import 'package:quark/core/consumer.dart';
import 'package:quark/muabe_quark.dart';

class DoubleBehavior extends Behavior<double> {
  DoubleBehavior(super.value);

  DoubleBehavior.infinity({String? behaviorID})
      : super.infinity(behaviorID: behaviorID);

  @override
  Comparison compare(Behavior<double> behavior) {
    return Comparison(value == behavior.value, value > behavior.value,
        value < behavior.value);
  }

  @override
  DoubleBehavior createInstance(Behavior<double> behavior) {
    return DoubleBehavior(behavior.value);
  }

  @override
  DoubleBehavior minus(Behavior<double> behavior) {
    return DoubleBehavior(value - behavior.value);
  }

  @override
  DoubleBehavior plus(Behavior<double> behavior) {
    return DoubleBehavior(value + behavior.value);
  }
}
