import 'package:flutter/material.dart';
import 'package:pokedex/card_pokemon.dart';
import 'package:pokedex/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "Pokedex", home: Home());
  }
}
