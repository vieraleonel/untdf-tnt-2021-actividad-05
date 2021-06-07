import 'package:actividad_05/screens/home/anime_tab_screen.dart';
import 'package:actividad_05/screens/home/favs_tab_screen.dart';
import 'package:actividad_05/screens/home/home_tab_screen.dart';
import 'package:actividad_05/screens/home/search_tab_screen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  _getTitle() {
    switch (currentPage) {
      case 0:
        return 'MyComics';
        break;
      case 1:
        return 'Anime';
        break;
      case 2:
        return 'Search';
        break;
      case 3:
        return 'Favs';
        break;
      default:
        return Text('ERROR');
    }
  }

  _getBody() {
    switch (currentPage) {
      case 0:
        return HomeTabScreen();
        break;
      case 1:
        return AnimeTabScreen();
        break;
      case 2:
        return SearchTabScreen();
        break;
      case 3:
        return FavsTabScreen();
        break;
      default:
        return Text('ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            _getTitle(),
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: _getBody(),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.receipt, title: "Comics"),
            TabData(iconData: Icons.tv_rounded, title: "Anime"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.favorite, title: "Favs")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}
