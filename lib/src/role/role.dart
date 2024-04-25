import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:quark/muabe_quark.dart';

abstract class Role<B extends Behavior, Data> extends PlayerPlugin<B, Data> {
  final Transformation<B, Data>? transformation;
  late BuildContext _context;
  late ActorModel _actor;

  Role({this.transformation}) : super(transformation ?? SimplePlayTransform());

  void initialize(BuildContext context) {
    this._context = context;
    _actor = ActorInfo.of(_context).model;
  }

  void role(ActorModel actor, Data value, BuildContext context);

  @override
  void play(Data data, B min, B max) {
    this.role(_actor, data, _context);
  }
}
