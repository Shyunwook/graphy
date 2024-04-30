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
// 같은 계열의 Role일 경우 파라미터 옵션을 통해 재사용이 가능
/// ex)
/// moveHorizontal -> addRole(MoveRole(Offset.x));
/// moveVertical -> addRole(MoveRole(Offset.Y));

extension RolesExtensions on Roles {
  Roles moveHorizontal() => addCollection(
        MoveHorizontalRole(),
      );
}
