// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:quark/core/consumer.dart';
import 'package:quark/muabe_quark.dart';

class OffsetAction extends ActionPlugin<Offset> {
  OffsetAction(super.value);

  @override
  Comparison compare(ActionPlugin<Offset> action) {
    return Comparison(
      value == action.value,
      value > action.value,
      value < action.value,
    );
  }

  @override
  OffsetAction minus(ActionPlugin<Offset> action) {
    return OffsetAction(value - action.value);
  }

  @override
  OffsetAction plus(ActionPlugin<Offset> action) {
    return OffsetAction(value + action.value);
  }
}
