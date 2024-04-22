import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphy/src/scenario/sceanrio_generator.dart';
import 'package:quark/core/quark.dart';
import 'package:quark/muabe_quark.dart' as quark;

typedef Scenario = quark.Element;

abstract class ScenarioController {
  late Quark quark;
  late ScenarioGenerator generator;

  Scenario create();

  void initialize(BuildContext context) {
    generator = ScenarioGenerator(context: context);
    quark = Quark(create());
  }
}
