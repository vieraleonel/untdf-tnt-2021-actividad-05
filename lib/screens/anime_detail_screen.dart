import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// class AnimeDetailScreen extends StatefulWidget {
//   const AnimeDetailScreen({Key key, this.anime}) : super(key: key);

//   final String anime;

//   @override
//   _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
// }

// class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
//   List<dynamic> favouritedAnimeIds = [];

//   toggleFavourite(int animeId) => () async {
//         setState(() {
//           if (favouritedAnimeIds.indexOf(animeId) >= 0) {
//             favouritedAnimeIds.remove(animeId);
//           } else {
//             favouritedAnimeIds.add(animeId);
//           }
//         });

//         try {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String favouriteAnimes = prefs.getString('favouriteAnimes') ?? '[]';

//           print('From sharedProps $favouriteAnimes');

//           List<dynamic> favouriteAnimesIds = json.decode(favouriteAnimes);

//           if (favouriteAnimesIds.indexOf(animeId) >= 0) {
//             favouriteAnimesIds.remove(animeId);
//           } else {
//             favouriteAnimesIds.add(animeId);
//           }

//           await prefs.setString(
//               'favouriteAnimes', json.encode(favouriteAnimesIds));
//         } catch (e) {
//           print('Err $e');
//           SharedPreferences.setMockInitialValues({});
//         }
//       };

//   getFavouriteAnimes() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String favouriteAnimes = prefs.getString('favouriteAnimes') ?? '[]';
//       List<dynamic> animeFavourites = json.decode(favouriteAnimes);

//       print('From INIT STATE $animeFavourites');
//       setState(() {
//         favouritedAnimeIds = animeFavourites;
//       });
//     } catch (e) {
//       print('Err $e');
//       SharedPreferences.setMockInitialValues({});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getFavouriteAnimes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final anime = ModalRoute.of(context).settings.arguments as Anime;

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           title: Text(
//             'Anime',
//             style: TextStyle(color: Colors.black87),
//           ),
//         ),
//         body: Column(
//           children: [
//             Text(anime != null ? anime.name : 'Error?'),
//             GestureDetector(
//                 child: BtnFavourite(
//                     active: favouritedAnimeIds
//                             .indexOf(anime != null ? anime.id : 0) >=
//                         0),
//                 onTap: toggleFavourite(anime != null ? anime.id : 0)),
//           ],
//         ));
//   }
// }

// class BtnFavourite extends StatelessWidget {
//   const BtnFavourite({Key key, this.active}) : super(key: key);

//   final bool active;

//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       active ? Icons.favorite : Icons.favorite_outline,
//       color: active ? Colors.red.shade300 : Colors.black,
//       size: 30.0,
//     );
//   }
// }
