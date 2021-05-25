import 'package:actividad_05/models/character.dart';
import 'package:actividad_05/screens/home/widgets/character_hero_implementation.dart';
import 'package:flutter/material.dart';

class CharacterHero extends StatelessWidget {
  const CharacterHero({Key key, this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return CharacterHeroImplementation(character: character);
  }
}
