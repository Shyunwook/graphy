import 'package:graphy/src/scenario/scenario_controller.dart';
import 'package:quark/muabe_quark.dart';

class Combine {
  static Scenario or(List<Element> list) {
    return Compound(list.hashCode.toString(), Or())..combine(list);
  }

  static Scenario and(List<Element> list) {
    return Compound(list.hashCode.toString(), And())..combine(list);
  }

  static Scenario next(List<Element> list) {
    return Compound(list.hashCode.toString(), Next())..combine(list);
  }
}
