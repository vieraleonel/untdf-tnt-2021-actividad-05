import 'package:actividad_05/screens/anime_detail_screen.dart';
import 'package:actividad_05/screens/character_detail/character_detail_screen.dart';
import 'package:actividad_05/screens/comic_detail.dart';
import 'package:actividad_05/screens/creator_detail.dart';
import 'package:actividad_05/screens/event_detail.dart';
import 'package:actividad_05/screens/home/home_screen.dart';
import 'package:actividad_05/screens/serie_detail.dart';
import 'package:get/route_manager.dart';

const Map<String, String> ROUTE_NAMES = {
  'HOME': '/home',
  'CHARACTER_DETAIL': '/character-details',
  'SERIE_DETAIL': '/serie-details',
  'COMIC_DETAIL': '/comic-details',
  'EVENT_DETAIL': '/event-details',
  'CREATOR_DETAIL': '/creator-details',
  'ANIME_DETAIL': '/anime-details',
};

final List<GetPage<dynamic>> routes = [
  GetPage(name: ROUTE_NAMES['HOME'], page: () => HomeScreen()),
  GetPage(
      name: ROUTE_NAMES['CHARACTER_DETAIL'],
      page: () => CharacterDetailScreen()),
  GetPage(name: ROUTE_NAMES['SERIE_DETAIL'], page: () => SerieDetailScreen()),
  GetPage(name: ROUTE_NAMES['COMIC_DETAIL'], page: () => ComicDetailScreen()),
  GetPage(name: ROUTE_NAMES['EVENT_DETAIL'], page: () => EventDetailScreen()),
  GetPage(
      name: ROUTE_NAMES['CREATOR_DETAIL'], page: () => CreatorDetailScreen()),
  GetPage(name: ROUTE_NAMES['ANIME_DETAIL'], page: () => AnimeDetailScreen()),
];
