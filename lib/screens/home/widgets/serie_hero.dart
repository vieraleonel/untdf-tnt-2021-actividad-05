import 'package:actividad_05/models/character.dart';
import 'package:actividad_05/models/serie.dart';
import 'package:actividad_05/screens/home/widgets/serie_hero_implementation.dart';
import 'package:flutter/material.dart';

class SerieHero extends StatelessWidget {
  const SerieHero({Key key, this.serie}) : super(key: key);

  final Serie serie;

  @override
  Widget build(BuildContext context) {
    return SerieHeroImplementation(serie: serie);
  }
}
