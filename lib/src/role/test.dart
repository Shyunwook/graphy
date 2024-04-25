import 'package:graphy/graphy.dart';
import 'package:graphy/src/role/role.dart';

///////////////////////////////////////////////////////////////
//////////// Common ///////////////////////////////////////////
///////////////////////////////////////////////////////////////

abstract class Collector<T> {
  final List<T> _collections = [];
  List<T> get() => _collections;

  void add(T value) {
    _collections.add(value);
  }
}

mixin CollectorManager<T extends Collector<U>, U> on Collector<U> {
  T addCollection(U value) => throw UnimplementedError();
}

///////////////////////////////////////////////////////////////
//////////// Role /////////////////////////////////////////////
///////////////////////////////////////////////////////////////

// class RoleCollection {
//   final List<Role> _roles = [];

//   RoleCollection _addRole(Role role) {
//     _roles.add(role);

//     return this;
//   }
// }

// addon 버전
class Roles extends Collector<Role> with CollectorManager<Roles, Role> {
  @override
  Roles addCollection(Role value) {
    add(value);

    return this;
  }
}

// 같은 계열의 Role일 경우 파라미터 옵션을 통해 재사용이 가능할지도?
/// ex)
/// moveHorizontal -> addRole(MoveRole(Offset.x));
/// moveVertical -> addRole(MoveRole(Offset.Y));
/// => 다시 보니 이런식으로 할 수 있는게 몇개나 있을까 싶기도하고.
/// 근데 뭐 일단 오케

extension RolesExtensions on Roles {
  Roles moveHorizontal() => addCollection(
        MoveHorizontalRole(),
      );
}

///////////////////////////////////////////////////////////////
//////////// Detector /////////////////////////////////////////
///////////////////////////////////////////////////////////////

// class DetectorCollection {
//   final List<Detector> _detectors = [];

//   DetectorCollection _addDetector(Detector detector) {
//     _detectors.add(detector);

//     return this;
//   }
// }

// addon 버전
class Detectors extends Collector<Detector>
    with CollectorManager<Detectors, Detector> {
  @override
  Detectors addCollection(Detector value) {
    add(value);

    return this;
  }
}

extension DetectorsExtensions on Detectors {
  Detectors dragGesture() => addCollection(
        DragGestureDetector(),
      );
}

//// ====================================================================================
///
///

// 사용법
void test() {
  var roles = Roles().moveHorizontal().moveHorizontal().get();
  roles = [
    MoveHorizontalRole(),
    MoveHorizontalRole(),
  ];

  var detectors = Detectors().dragGesture().dragGesture().get();
  detectors = [
    DragGestureDetector(),
  ];
}

// =================================================================================

class Signs<T> {
  final Type signType;

  Signs._({required this.signType});

  factory Signs.gesture() => Signs._(signType: GestureSign);
}

void test2() {
  var test = Signs.gesture().signType;
}


// 불가능!!!