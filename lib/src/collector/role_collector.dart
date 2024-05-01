import 'package:graphy/graphy.dart';
import 'package:graphy/src/collector/collector.dart';
import 'package:graphy/src/collector/collector_manager.dart';
import 'package:graphy/src/role/role.dart';

class Roles extends Collector<Role> with CollectorManager<Roles, Role> {
  @override
  Roles addCollection(Role value) {
    add(value);

    return this;
  }
}

// TODO
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
