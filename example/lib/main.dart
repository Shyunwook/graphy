import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scene(
            actors: [
              Actor(
                name: 'BOBBY',
                scenarioController: BobbyScenario(),
                child: const EmptyChild(),
              ),
              Actor(
                initialPosition: const Offset(200, 0),
                scenarioController: BobbyScenario(),
                child: const EmptyChild(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BobbyScenario extends ScenarioController {
  @override
  Scenario create() {
    return generator.withSignTypeAndModule(
      [
        SignType.gesture,
      ],
      DragHorizontalModule(min: 0, max: 100),
      [
        MoveHorizontalRole(),
      ],
    );
  }
}

class EmptyChild extends StatelessWidget {
  const EmptyChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Color(Random().nextInt(0xffffffff)),
    );
  }
}
