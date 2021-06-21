import 'package:actividad_05/models/marvel_event.dart';
import 'package:actividad_05/screens/event_detail_implementation.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MarvelEvent event =
        ModalRoute.of(context).settings.arguments as MarvelEvent;
    return EventDetailScreenImplementation(event: event);
  }
}
