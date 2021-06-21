import 'package:actividad_05/models/creator.dart';
import 'package:actividad_05/screens/creator_detail_implementation.dart';
import 'package:flutter/material.dart';

class CreatorDetailScreen extends StatelessWidget {
  const CreatorDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Creator creator =
        ModalRoute.of(context).settings.arguments as Creator;
    return CreatorDetailScreenImplementation(creator: creator);
  }
}
