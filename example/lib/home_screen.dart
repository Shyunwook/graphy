import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// build 안에서 controller 인스턴스 생성하면, rebuild 시 모델이 재생성되어
  /// player로 넘어가는 value가 초기화 될 것임
  final s1 = BobbyScenario();
  final s2 = BobbyScenario2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scene(
        actors: [
          Actor(
            name: 'BOBBY',
            scenarioController: s1,
            child: const EmptyChild(),
          ),
          Actor(
            target: 'BOBBY',
            initialPosition: const Offset(200, 0),
            scenarioController: s2,
            child: const EmptyChild(),
          ),
        ],
      ),
    ));
  }
}

class BobbyScenario extends ScenarioController {
  @override
  Scenario create() {
    Scenario horizontalDragHorizontalMove = generateWithModule(
      Detectors().accelerometer().toList(),
      AccelerometerXModule(
        min: 0,
        max: 200,
      ),
      Roles().moveHorizontal().toList(),
    );

    return horizontalDragHorizontalMove;
  }
}

class BobbyScenario2 extends ScenarioController {
  @override
  Scenario create() {
    Scenario horizontalDragHorizontalMove = generate(
      GestureSign.dragHorizontal(min: 0, max: 400),
      [],
    );

    return horizontalDragHorizontalMove;
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