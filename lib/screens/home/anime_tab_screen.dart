import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final String commonStructureFragment = r"""
      id
      title {
        userPreferred
      }
      coverImage {
        extraLarge
        large
        color
      }
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
      bannerImage
      season
      status(version: 2)
      episodes
      # genres
      averageScore
      popularity
      studios(isMain: true) {
        edges {
          isMain
          node {
            id
            name
          }
        }
      }
  """;

class AnimeTabScreen extends StatelessWidget {
  AnimeTabScreen({Key key}) : super(key: key);

  final String queryAnimeTab = """
    query (\$season: MediaSeason, \$seasonYear: Int, \$nextSeason: MediaSeason, \$nextYear: Int) {
      trending: Page(page: 1, perPage: 6) {
        media(sort: TRENDING_DESC, type: ANIME, isAdult: false) {
          $commonStructureFragment
        }
      }
      season: Page(page: 1, perPage: 6) {
        media(season: \$season, seasonYear: \$seasonYear, sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
          $commonStructureFragment
        }
      }
      nextSeason: Page(page: 1, perPage: 6) {
        media(season: \$nextSeason, seasonYear: \$nextYear, sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
          $commonStructureFragment
        }
      }
      popular: Page(page: 1, perPage: 6) {
        media(sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
          $commonStructureFragment
        }
      }
      top: Page(page: 1, perPage: 6) {
        media(sort: SCORE_DESC, type: ANIME, isAdult: false) {
          $commonStructureFragment
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: gql(queryAnimeTab),
          variables: {
            "season": "SPRING",
            "seasonYear": 2021,
            "nextSeason": "SUMMER",
            "nextYear": 2021
          },
          fetchPolicy: FetchPolicy.noCache),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          print(result.exception);
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Text('Loading...');
        }

        List<dynamic> media = result.data['trending']['media'];

        return ListView.builder(
            itemCount: media.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: Text(media[index]['title']['userPreferred']));
            });
      },
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
