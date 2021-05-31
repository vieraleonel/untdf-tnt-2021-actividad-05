import 'package:actividad_05/models/character.dart';
import 'package:actividad_05/screens/character_detail_screen.dart';
import 'package:actividad_05/screens/home/home_screen.dart';
import 'package:flutter/widgets.dart';

const Map<String, String> ROUTE_NAMES = {
  'HOME': 'Home',
  'CHARACTER_DETAIL': 'Details',
};

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ROUTE_NAMES['HOME']: (BuildContext context) => HomeScreen(),
  ROUTE_NAMES['CHARACTER_DETAIL']: (BuildContext context) =>
      CharacterDetailScreen(),
};
