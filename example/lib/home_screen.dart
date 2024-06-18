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
            scenario: s1,
            child: const EmptyChild(),
          ),
          Actor(
            name: 'jaro',
            target: 'BOBBY',
            initialPosition: const Offset(200, 0),
            scenario: s2,
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
    var sign = GestureSign.dragHorizontal();
    var roles =
        Roles().moveHorizontal().moveHorizontal().moveHorizontal().toList();

    var detector = Detectors().accelerometer().dragGesture().toList();
    var module = DragHorizontalModule();

    var s1 =
        generate(Sign(detector: DragGestureDetector(), module: module), roles);
    var s2 =
        generate(Sign(detector: DragGestureDetector(), module: module), roles);

    return Combine.next([s1, s2]);

    return generate(
        Sign(detector: DragGestureDetector(), module: module), roles);
  }
}

class BobbyScenario2 extends ScenarioController {
  @override
  Scenario create() {
    Scenario horizontalDragHorizontalMove = generate(
      GestureSign.dragHorizontal(min: 0, max: 400),
      Roles().moveHorizontal().toList(),
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
