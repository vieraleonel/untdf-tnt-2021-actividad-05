import 'dart:convert';

import 'package:actividad_05/contants.dart';
import 'package:actividad_05/models/character.dart';
import 'package:actividad_05/models/comics.dart';
import 'package:actividad_05/models/creator.dart';
import 'package:actividad_05/models/event.dart';
import 'package:actividad_05/models/marvel_response.dart';
import 'package:actividad_05/models/serie.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class MarvelApiService {
  static const String MARVEL_API_BASE = "gateway.marvel.com";
  static const String MARVEL_API_VERSION = "/v1/public";
  static const String MARVEL_ATTRIBUTION =
      "Data provided by Marvel. © 2014 Marvel";

  String _generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = crypto.md5.convert(content);
    return hex.encode(digest.bytes);
  }

  Uri _buildUri(String path, {Map<String, String> queryParams}) {
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, String> baseQryParams = {
      "ts": ts,
      "apikey": MARVEL_API_PUBLIC_KEY,
      "hash": _generateMd5(ts + MARVEL_API_PRIVATE_KEY + MARVEL_API_PUBLIC_KEY)
    };
    if (queryParams != null) {
      baseQryParams.addAll(queryParams);
    }
    Uri uri =
        Uri.https(MARVEL_API_BASE, MARVEL_API_VERSION + path, baseQryParams);
    print(uri.toString());
    return uri;
  }

  Future<MarvelResponse<Character>> getAllCharacters(
          {Map<String, String> queryParams: const {"orderBy": "-modified"}}) =>
      http.get(_buildUri('/characters', queryParams: queryParams)).then(
          (response) => MarvelResponse<Character>.fromRawJson(response.body));

  Future<MarvelResponse<Serie>> getAllSeries(
          {Map<String, String> queryParams: const {"orderBy": "-modified"}}) =>
      http
          .get(_buildUri('/series', queryParams: queryParams))
          .then((response) => MarvelResponse<Serie>.fromRawJson(response.body));

  Future<MarvelResponse<Comic>> getAllComics(
          {Map<String, String> queryParams: const {"orderBy": "-modified"}}) =>
      http
          .get(_buildUri('/comics', queryParams: queryParams))
          .then((response) => MarvelResponse<Comic>.fromRawJson(response.body));

  Future<MarvelResponse<Event>> getAllEvents(
          {Map<String, String> queryParams: const {"orderBy": "-modified"}}) =>
      http
          .get(_buildUri('/events', queryParams: queryParams))
          .then((response) => MarvelResponse<Event>.fromRawJson(response.body));

  Future<MarvelResponse<Creator>> getAllCreators(
          {Map<String, String> queryParams: const {"orderBy": "-modified"}}) =>
      http.get(_buildUri('/creators', queryParams: queryParams)).then(
          (response) => MarvelResponse<Creator>.fromRawJson(response.body));
}
