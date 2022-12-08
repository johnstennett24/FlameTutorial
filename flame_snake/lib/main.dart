import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame_snake/EmberQuest.dart';

void main() {
  runApp(const GameWidget<EmberQuest>.controlled(gameFactory: EmberQuest.new));
}
