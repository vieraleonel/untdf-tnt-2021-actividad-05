import 'package:actividad_05/screens/home/widgets/serie_hero_list.dart';
import 'package:actividad_05/screens/home/widgets/character_hero_list.dart';
import 'package:actividad_05/widgets/attribution.dart';
import 'package:actividad_05/widgets/comic_list.dart';
import 'package:actividad_05/widgets/creator_list.dart';
import 'package:actividad_05/widgets/event_list.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'MyComics',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: ListView(children: [
          CharacterHeroList(),
          SerieHeroList(),
          ComicList(),
          EventList(),
          CreatorList(),
          Attribution(),
        ]));
  }
}
