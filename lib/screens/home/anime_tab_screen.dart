import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AnimeTabScreen extends StatelessWidget {
  const AnimeTabScreen({Key key}) : super(key: key);

  final String specificMedia = """
    query {
      Media(id: 100932) {
        title {
          romaji
          english
          native
          userPreferred
        }
        type
        tags {
          name
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(specificMedia),
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Text('Loading...');
        }

        List<dynamic> tags = result.data['Media']['tags'];

        return ListView.builder(
            itemCount: tags.length,
            itemBuilder: (context, index) {
              return Text(tags[index]['name']);
            });
      },
    );
    ;
  }
}
