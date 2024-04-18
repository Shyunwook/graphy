import 'package:flutter/material.dart';
import 'package:graphy/src/quark/action/action.dart';
import 'package:graphy/src/quark/behavior/behavior.dart';
import 'package:quark/muabe_quark.dart';

class OffsetXToDoubleTranslator
    extends Translator<OffsetAction, DoubleBehavior> {
  @override
  OffsetAction? reversedTranslate(String actionID, DoubleBehavior behavior) {
    if (behavior.infinity) {
      return null;
    }
    return OffsetAction(Offset(behavior.value, 0));
  }

  @override
  DoubleBehavior translate(
    OffsetAction action,
    OffsetAction? minAction,
    OffsetAction? maxAction,
  ) {
    return DoubleBehavior(action.value.dx);
  }
}
