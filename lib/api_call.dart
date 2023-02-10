import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/details_page.dart';

class PokeCard extends StatefulWidget {
  const PokeCard({super.key});

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
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
        : GridView.builder(
            itemCount: pokemon.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Details(
                        name: pokemon[index]['name'],
                        image: pokemon[index]['image'],
                        sprite: pokemon[index]['sprite'],
                      );
                    }));
                  },
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("#" + pokemon[index]['id'].toString()),
                      ],
                    ),
                    Image.network(
                      pokemon[index]['image'],
                      height: 40,
                    ),
                    Text(pokemon[index]['name'])
                  ]));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
          );
  }
}
