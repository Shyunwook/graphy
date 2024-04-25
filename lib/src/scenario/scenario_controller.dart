import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphy/src/scenario/sceanrio_generator.dart';
import 'package:quark/core/quark.dart';
import 'package:quark/muabe_quark.dart' as quark;

typedef Scenario = quark.Element;

abstract class ScenarioController {
  late Quark quark;
  late ScenarioGenerator generator;
  final Map<Type, GestureRecognizerFactory<GestureRecognizer>> _gestures = {};

  Map<Type, GestureRecognizerFactory<GestureRecognizer>> get gestures =>
      _gestures;

  Scenario create();

  void initialize(BuildContext context) {
    generator = ScenarioGenerator(
      controller: this,
      context: context,
    );

    quark = Quark(create());
  }
}
