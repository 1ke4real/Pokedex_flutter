import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardPokemon extends StatefulWidget {
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  var datas;
  var pokemon;

  void initState() {
    super.initState();
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    var url = "https://pokebuildapi.fr/api/v1/pokemon/limit/100";
    var response = await http.get(Uri.parse(url));
    setState(() {
      datas = json.decode(response.body);
      pokemon = datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    var stats;
    return datas == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: <Widget>[
              for (var data in datas)
                Card(
                    child: SizedBox(
                  width: 300,
                  height: 230,
                  child: Center(
                    child: Column(children: [
                      Image.network(
                        data['image'],
                        height: 50,
                        width: 300,
                      ),
                      Text(
                        data['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Id du pokedex :" + data['pokedexId'].toString()),
                      Text("Ses Stats"),
                      Text("Hp :" + data["stats"]['HP'].toString()),
                      Text("Attack :" + data["stats"]['attack'].toString()),
                      Text("Defense :" + data["stats"]['defense'].toString()),
                      Text("Attaque Spécial :" +
                          data["stats"]['special_attack'].toString()),
                      Text("Défence Spéciale :" +
                          data["stats"]['special_defense'].toString()),
                      Text("Vitesse :" + data["stats"]['speed'].toString())
                    ]),
                  ),
                ))
            ],
          );
  }
}
