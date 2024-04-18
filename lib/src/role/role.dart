import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:quark/muabe_quark.dart';

abstract class Role<B extends Behavior, Data> extends PlayerPlugin<B, Data> {
  final Transformation<B, Data>? transformation;
  late final BuildContext _context;

  Role({this.transformation}) : super(transformation ?? SimplePlayTransform());

  void initialize(BuildContext context) {
    this._context = context;
  }

  void role(ActorModel actor, Data value, BuildContext context);

  @override
  void play(Data data, B min, B max) {
    ActorModel actor = ActorInfo.of(_context).model;

    this.role(actor, data, _context);
  }
}
