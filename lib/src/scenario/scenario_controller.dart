import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/role/role.dart';
import 'package:quark/core/module.dart';
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

class ScenarioGenerator {
  final BuildContext context;

  ScenarioGenerator({required this.context});

  // Manual
  Scenario withSignTypeAndModule(
    List<SignType> types,
    Module module,
    List<Role> roles,
  ) {
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
