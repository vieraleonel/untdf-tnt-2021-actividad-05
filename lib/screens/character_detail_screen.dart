import 'package:actividad_05/models/character.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  final Character character;

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  List<dynamic> favouritedCharacterIds = [];

  toggleFavourite(int characterId) => () async {
        setState(() {
          if (favouritedCharacterIds.indexOf(characterId) >= 0) {
            favouritedCharacterIds.remove(characterId);
          } else {
            favouritedCharacterIds.add(characterId);
          }
        });

        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String favouriteCharacters =
              prefs.getString('favouriteCharacters') ?? '[]';

          print('From sharedProps $favouriteCharacters');

          List<dynamic> favouriteCharactersIds =
              json.decode(favouriteCharacters);

          if (favouriteCharactersIds.indexOf(characterId) >= 0) {
            favouriteCharactersIds.remove(characterId);
          } else {
            favouriteCharactersIds.add(characterId);
          }

          await prefs.setString(
              'favouriteCharacters', json.encode(favouriteCharactersIds));
        } catch (e) {
          print('Err $e');
          SharedPreferences.setMockInitialValues({});
        }
      };

  getFavouriteCharacters() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String favouriteCharacters =
          prefs.getString('favouriteCharacters') ?? '[]';
      List<dynamic> characterFavourites = json.decode(favouriteCharacters);

      print('From INIT STATE $characterFavourites');
      setState(() {
        favouritedCharacterIds = characterFavourites;
      });
    } catch (e) {
      print('Err $e');
      SharedPreferences.setMockInitialValues({});
    }
  }

  @override
  void initState() {
    super.initState();
    getFavouriteCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context).settings.arguments as Character;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Character',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Column(
          children: [
            Text(character != null ? character.name : 'Error?'),
            GestureDetector(
                child: BtnFavourite(
                    active: favouritedCharacterIds
                            .indexOf(character != null ? character.id : 0) >=
                        0),
                onTap: toggleFavourite(character != null ? character.id : 0)),
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
