import 'package:quark/muabe_quark.dart';

import '../behavior/double.behavior.dart';
import '../module_type/module_type.dart';

class DoubleModule extends Module<DoubleBehavior> {
  final double? min;
  final double? max;

  final ModuleType<DoubleBehavior>? moduleType;

  DoubleModule({
    this.min,
    this.max,
    this.moduleType,
  }) : super(
          moduleType ?? DoubleModuleType(),
          min == null ? DoubleBehavior.infinity() : DoubleBehavior(min),
          max == null ? DoubleBehavior.infinity() : DoubleBehavior(max),
        );
}
