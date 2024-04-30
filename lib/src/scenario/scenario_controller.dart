import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:graphy/graphy.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/detector/detector.dart';
import 'package:graphy/src/role/role.dart';
import 'package:graphy/src/scene/scene_info.dart';
import 'package:quark/muabe_quark.dart';

typedef Scenario = Element;

abstract class ScenarioController {
  late Quark quark;
  late BuildContext _context;

  ScenarioController? _targetController;

  bool _needInitialized = true;
  bool get needInitialized => _needInitialized;

  final Map<Type, GestureRecognizerFactory<GestureRecognizer>> _gestures = {};
  Map<Type, GestureRecognizerFactory<GestureRecognizer>> get gestures =>
      _gestures;

  Scenario create();

  void initialize(BuildContext context, String? target) {
    _context = context;
    quark = Quark(create());

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

    _needInitialized = false;
  }

  void play(List<ActionPlugin<dynamic>> actions) {
    quark.play(actions);

    _targetController?.quark.play(actions);
  }

  Scenario generate(
    Sign sign,
    List<Role> roles,
  ) {
    return generateWithModule([sign.detector], sign.module, roles);
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
    for (final role in roles) {
      role.initialize(_context);
      module.addPlayer(role);
    }
  }
}
