import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AnimeDetailScreen extends StatefulWidget {
  const AnimeDetailScreen({Key key, this.anime}) : super(key: key);

  final String anime;

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  List<dynamic> favouritedAnimeIds = [];

  toggleFavourite(int animeId) => () async {
        setState(() {
          if (favouritedAnimeIds.indexOf(animeId) >= 0) {
            favouritedAnimeIds.remove(animeId);
          } else {
            favouritedAnimeIds.add(animeId);
          }
        });

        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String favouriteAnimes = prefs.getString('favouriteAnimes') ?? '[]';

          print('From sharedProps $favouriteAnimes');

          List<dynamic> favouriteAnimesIds = json.decode(favouriteAnimes);

          if (favouriteAnimesIds.indexOf(animeId) >= 0) {
            favouriteAnimesIds.remove(animeId);
          } else {
            favouriteAnimesIds.add(animeId);
          }

          await prefs.setString(
              'favouriteAnimes', json.encode(favouriteAnimesIds));
        } catch (e) {
          print('Err $e');
          SharedPreferences.setMockInitialValues({});
        }
      };

  getFavouriteAnimes() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String favouriteAnimes = prefs.getString('favouriteAnimes') ?? '[]';
      List<dynamic> animeFavourites = json.decode(favouriteAnimes);

      print('From INIT STATE $animeFavourites');
      setState(() {
        favouritedAnimeIds = animeFavourites;
      });
    } catch (e) {
      print('Err $e');
      SharedPreferences.setMockInitialValues({});
    }
  }

  Expanded listTiles(String title, String subTitle) {
    return Expanded(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getFavouriteAnimes();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic anime = ModalRoute.of(context).settings.arguments;

    print(anime['coverImage']['extraLarge']);

    return Scaffold(
        body: ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(60, 40),
                bottomRight: Radius.elliptical(60, 40)),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.9),
                blurRadius: 0,
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                  anime != null ? anime['coverImage']['extraLarge'] : null),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: 500,
        ),
        Text(anime != null ? anime['title']['userPreferred'] : 'Error?'),
        GestureDetector(
            child: BtnFavourite(
                active: favouritedAnimeIds
                        .indexOf(anime != null ? anime['id'] : 0) >=
                    0),
            onTap: toggleFavourite(anime != null ? anime['id'] : 0)),
        Text(anime != null && anime['description'] != null
            ? anime['description']
            : 'Error?'),
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         listTiles(
        //             'Airing',
        //             anime != null
        //                 ? anime['nextAiringEpisode']['episode'] +
        //                     ': ' +
        //                     ['airingAt']
        //                 : 'Error?'),
        //         listTiles(
        //             'Format', anime != null ? anime['format'] : 'Error?'),
        //       ],
        //     ),
        //     Row(children: [
        //       listTiles('Episode Duration',
        //           anime != null ? anime['duration'] : 'Error?'),
        //       listTiles('Status',
        //           anime != null ? anime['status(version: 2)'] : 'Error?'),
        //     ]),
        //     Row(
        //       children: [
        //         listTiles(
        //             'Start Date',
        //             anime != null
        //                 ? anime['startDate']['month'] +
        //                     ' ' +
        //                     ['day'] +
        //                     ', ' +
        //                     ['year']
        //                 : 'Error?'),
        //         listTiles(
        //             'Season',
        //             anime != null
        //                 ? anime['season'] + ' ' + ['seasonYear']
        //                 : 'Error?'),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         listTiles('Average Score',
        //             anime != null ? anime['averageScore'] : 'Error?'),
        //         listTiles('Mean Score',
        //             anime != null ? anime['meanScore'] : 'Error?'),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         listTiles('Popularity',
        //             anime != null ? anime['popularity'] : 'Error?'),
        //         listTiles('Favorites',
        //             anime != null ? anime['favourites'] : 'Error?'),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    ));
  }
}

class BtnFavourite extends StatelessWidget {
  const BtnFavourite({Key key, this.active}) : super(key: key);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Icon(
      active ? Icons.favorite : Icons.favorite_outline,
      color: active ? Colors.red.shade300 : Colors.black,
      size: 30.0,
    );
  }
}

/*
Consulta para la pagina de ficha

query media($id: Int, $type: MediaType, $isAdult: Boolean) {
  Media(id: $id, type: $type, isAdult: $isAdult) {
    id
    title {
      userPreferred
      romaji
      english
      native
    }
    coverImage {
      extraLarge
      large
    }
    bannerImage
    startDate {
      year
      month
      day
    }
    endDate {
      year
      month
      day
    }
    description
    season
    seasonYear
    type
    format
    status(version: 2)
    episodes
    duration
    chapters
    volumes
    genres
    synonyms
    source(version: 2)
    isAdult
    isLocked
    meanScore
    averageScore
    popularity
    favourites
    hashtag
    countryOfOrigin
    isLicensed
    isFavourite
    isRecommendationBlocked
    nextAiringEpisode {
      airingAt
      timeUntilAiring
      episode
    }
    relations {
      edges {
        id
        relationType(version: 2)
        node {
          id
          title {
            userPreferred
          }
          format
          type
          status(version: 2)
          bannerImage
          coverImage {
            large
          }
        }
      }
    }
    characterPreview: characters(perPage: 6, sort: [ROLE, RELEVANCE, ID]) {
      edges {
        id
        role
        name
        voiceActors(language: JAPANESE, sort: [RELEVANCE, ID]) {
          id
          name {
            full
          }
          language: languageV2
          image {
            large
          }
        }
        node {
          id
          name {
            full
          }
          image {
            large
          }
        }
      }
    }
    staffPreview: staff(perPage: 8, sort: [RELEVANCE, ID]) {
      edges {
        id
        role
        node {
          id
          name {
            full
          }
          language: languageV2
          image {
            large
          }
        }
      }
    }
    studios {
      edges {
        isMain
        node {
          id
          name
        }
      }
    }
    reviewPreview: reviews(perPage: 2, sort: [RATING_DESC, ID]) {
      pageInfo {
        total
      }
      nodes {
        id
        summary
        rating
        ratingAmount
        user {
          id
          name
          avatar {
            large
          }
        }
      }
    }
    recommendations(perPage: 7, sort: [RATING_DESC, ID]) {
      pageInfo {
        total
      }
      nodes {
        id
        rating
        userRating
        mediaRecommendation {
          id
          title {
            userPreferred
          }
          format
          type
          status(version: 2)
          bannerImage
          coverImage {
            large
          }
        }
        user {
          id
          name
          avatar {
            large
          }
        }
      }
    }
    externalLinks {
      site
      url
    }
    streamingEpisodes {
      site
      title
      thumbnail
      url
    }
    trailer {
      id
      site
    }
    rankings {
      id
      rank
      type
      format
      year
      season
      allTime
      context
    }
    tags {
      id
      name
      description
      rank
      isMediaSpoiler
      isGeneralSpoiler
    }
    mediaListEntry {
      id
      status
      score
    }
    stats {
      statusDistribution {
        status
        amount
      }
      scoreDistribution {
        score
        amount
      }
    }
  }
}

{
"id": 1024, "type": "ANIME", "isAdult": false
}
 */
