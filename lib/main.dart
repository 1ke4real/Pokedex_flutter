import 'package:flutter/material.dart';
import 'package:pokedex/card_pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedex",
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/pokedex-icon.png',
                  scale: 12,
                ),
                Text('Pokedex')
              ],
            ),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: CardPokemon(),
                ),
              ],
            ),
          )),
    );
  }
}
