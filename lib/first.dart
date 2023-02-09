import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/769px-Pokebola-pokeball-png-0.png',
            height: 100,
          ),
          Text(
            "Pokedex",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Text(
                "Il s'agis d'un prototype avec flutter qui permet d'afficher tous les pokemons du pokedex avec une limite de 100 pokemons"),
          )
        ],
      ),
    );
  }
}
