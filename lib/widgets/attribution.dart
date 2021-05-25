import 'package:actividad_05/services/marvel_api_service.dart';
import 'package:flutter/material.dart';

class Attribution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        MarvelApiService.MARVEL_ATTRIBUTION,
        textAlign: TextAlign.center,
      ),
    );
  }
}
