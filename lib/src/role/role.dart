import 'package:graphy/src/actor/actor_model.dart';
import 'package:quark/muabe_quark.dart';

abstract class Role<B extends Behavior, Data> extends PlayerPlugin<B, Data> {
  final Transformation<B, Data>? transformation;
  late final ActorModel actor;

  Role({this.transformation}) : super(transformation ?? SimplePlayTransform());

  // ignore: use_setters_to_change_properties
  void initialize(ActorModel actor) {
    this.actor = actor;
  }

  void role(Data value);

  @override
  void play(Data data, B min, B max) {
    this.role(data);
  }
}
