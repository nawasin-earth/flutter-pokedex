import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedexapi/pokemon_model.dart';
import 'pokemon_service.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonService pokemonService = PokemonService();
  PokemonDetailScreen(
      {required this.title, required this.url, required this.page});
  String title;
  String url;
  String page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
    
        body: FutureBuilder(
          future: pokemonService.getPokemonModel(page.toString()),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              String? image;
              image = data.sprites?.frontDefault;
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Image.network(image!),
                      Text(
                          "Name: ${data.name!.toString().toUpperCase()}\nBase Experience: ${data.baseExperience!}")
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
