import 'package:graphy/graphy.dart';
import 'package:graphy/src/role/move_horizontal.role.dart';
import 'package:graphy/src/role/role.dart';
import 'package:graphy/src/sign/sign.dart';
import 'package:quark/core/module.dart';
import 'package:quark/muabe_quark.dart' as quark;

typedef Scenario = quark.Element;

abstract class ScenarioController {
  late final Scenario scenario;
  ScenarioGenerator generator = ScenarioGenerator();

  ScenarioController() {
    scenario = create();
  }

  Scenario create();
}

class ScenarioGenerator {
  Scenario withSign() {
    const SignType type = SignType.gesture;

    final Module module = DragHorizontalModule(min: 0, max: 100);
    final Role role = MoveHorizontalRole();

    module.addPlayer(role);

    return Combine.or([module]);
  }

  Scenario withSignTypeAndModule(
    List<SignType> types,
    Module module,
    Role role,
  ) {
    return Combine.or([]);
  }
}

// class ScenarioPreset {
//   final Scenario moveHorizontalWithDragHorizontal =
//       ScenarioGenerator().withSign(
//     SignPreset.DragHorizontal,
//     MoveHorizontal(),
//   );

//   final Scenario moveHorizontalWithSound =
//       ScenarioGenerator().withSignTypeAndModule(
//     [
//       SignType.sound,
//     ],
//     SoundDecibelModule(),
//     MoveHorizontal(),
//   );

//   final Scenario moveHorizontalWithSound2 = ScenarioGenerator().withSign(
//     SignPreset.SoundDecibel,
//     MoveHorizontal(),
//   );
// }

// class SignPreset {
//   static final Sign DragHorizontal = Sign(
//     type: SignType.gesture,
//     module: DragHorizontalModule(),
//   );

//   static final Sign SoundDecibel = Sign(
//     type: SignType.sound,
//     module: SoundDecibelModule(),
//   );
// }
