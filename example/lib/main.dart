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
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scene(
            actors: [
              Actor(
                name: 'BOBBY',
                child: EmptyChild(),
              ),
              Actor(
                initialPosition: Offset(200, 0),
                child: EmptyChild(),
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
    // SignType.Module.Role

    // // Preset
    // var scenario = generator.preset.moveHorizontalWithDragHorizontal;

    // // Semi
    // scenario = generator.withSign(
    //   DragHorizontal(),
    //   MoveHorizontal(),
    // );

    // // Manual
    // scenario = generator.withSignTypeAndModule(
    //   [GestureSign()],
    //   DragHorizontalModule(),
    //   MoveHorizontal(),
    // );

    // return scenario;

    return ScenarioGenerator().withSign();

    throw UnimplementedError();
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
