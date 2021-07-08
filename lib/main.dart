import 'package:actividad_05/routes.dart';
import 'package:actividad_05/screens/home/home_screen.dart';
import 'package:actividad_05/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: Link.from([HttpLink('https://graphql.anilist.co')]),
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: GetMaterialApp(
          title: 'MyComAni',
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          initialRoute: ROUTE_NAMES['HOME'],
          getPages: routes,
        ));
  }
}
