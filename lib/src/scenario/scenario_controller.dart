import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/scenario/sceanrio_generator.dart';
import 'package:graphy/src/scene/scene_info.dart';
import 'package:quark/muabe_quark.dart' as quark;
import 'package:quark/muabe_quark.dart';

typedef Scenario = quark.Element;

abstract class ScenarioController {
  late Quark quark;
  late ScenarioGenerator generator;
  late BuildContext context;
  String? target;
  ScenarioController? targetController;

  bool needInitialized = true;

  final Map<Type, GestureRecognizerFactory<GestureRecognizer>> _gestures = {};

  Map<Type, GestureRecognizerFactory<GestureRecognizer>> get gestures =>
      _gestures;

  Scenario create();

  void initialize(BuildContext context, String? target) {
    this.context = context;
    this.target = target;

    generator = ScenarioGenerator(
      controller: this,
    );

    quark = Quark(create());

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (target != null) {
          final BuildContext? targetContext =
              SceneInfo.of(context).getTarget(target);
          if (targetContext != null) {
            targetController = ActorInfo.of(targetContext).model.controller;
          }
        }
      },
    );

    needInitialized = false;
  }

  void play(List<ActionPlugin<dynamic>> actions) {
    quark.play(actions);

    targetController?.play(actions);
  }
}
