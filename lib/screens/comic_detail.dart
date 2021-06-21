import 'package:actividad_05/models/comic.dart';
import 'package:actividad_05/screens/comic_detail_implementation.dart';
import 'package:flutter/material.dart';

class ComicDetailScreen extends StatelessWidget {
  const ComicDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Comic comic = ModalRoute.of(context).settings.arguments as Comic;
    return ComicDetailScreenImplementation(comic: comic);
  }
}
