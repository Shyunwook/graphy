import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/role/role.dart';
import 'package:quark/core/module.dart';

class ScenarioGenerator {
  final ScenarioController controller;
  final BuildContext context;

  ScenarioGenerator({
    required this.controller,
    required this.context,
  });

  // Semi
  Scenario withSign(
    Sign sign,
    List<Role> roles,
  ) {
    return withSignTypeAndModule([sign.detector], sign.module, roles);
  }

  // Manual
  Scenario withSignTypeAndModule(
    List<Detector> detectors,
    Module module,
    List<Role> roles,
  ) {
    for (final Detector detector in detectors) {
      detector.start(controller);
    }

    _addRoles(module, roles);
    return module;
  }

  void _addRoles(Module module, List<Role> roles) {
    for (final role in roles) {
      role.initialize(context);
      module.addPlayer(role);
    }
  }
}
