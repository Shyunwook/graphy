import 'package:flutter/material.dart';
import 'package:quark/muabe_quark.dart';

import '../action/action.dart';
import '../behavior/behavior.dart';

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
      OffsetAction action, OffsetAction? minAction, OffsetAction? maxAction) {
    return DoubleBehavior(action.value.dx);
  }
}
