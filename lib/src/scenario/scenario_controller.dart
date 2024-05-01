import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:graphy/graphy.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/detector/detector.dart';
import 'package:graphy/src/role/role.dart';
import 'package:graphy/src/scene/scene_info.dart';
import 'package:quark/muabe_quark.dart';

typedef Scenario = Element;

abstract class ScenarioController {
  late Quark _quark;
  late BuildContext _context;

  ScenarioController? _targetController;

  bool _needInitialized = true;
  bool get needInitialized => _needInitialized;

  // GestureDetectorType 세팅 될 때 recognizer가 추가됨
  final Map<Type, GestureRecognizerFactory<GestureRecognizer>> _gestures = {};
  Map<Type, GestureRecognizerFactory<GestureRecognizer>> get gestures =>
      _gestures;

  Scenario create();

  void initialize(BuildContext context, String? target) {
    _context = context;
    _quark = Quark(create());
    _setTargetScenarioController(context, target);

    _needInitialized = false;
  }

  void play(List<ActionPlugin<dynamic>> actions) {
    _quark.play(actions);

    _targetController?._quark.play(actions);
  }

  Scenario generate(
    Sign sign,
    List<Role> roles,
  ) {
    return generateWithModule(
      [sign.detector],
      sign.module,
      roles,
    );
  }

  Scenario generateWithModule(
    List<Detector> detectors,
    Module module,
    List<Role> roles,
  ) {
    for (final Detector detector in detectors) {
      detector.start(this);
    }

    _addRoles(module, roles);
    return module;
  }

  void _addRoles(Module module, List<Role> roles) {
    final ActorModel actor = ActorInfo.of(_context).model;

    for (final role in roles) {
      role.initialize(_context, actor);
      module.addPlayer(role);
    }
  }

  void _setTargetScenarioController(BuildContext context, String? target) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (target != null) {
          final BuildContext? targetContext =
              SceneInfo.of(context).getTarget(target);
          if (targetContext != null) {
            _targetController = ActorInfo.of(targetContext).model.controller;
          }
        }
      },
    );
  }
}
