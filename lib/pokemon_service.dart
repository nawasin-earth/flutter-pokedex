import 'package:flutter/cupertino.dart';
import 'package:pokedexapi/pokemon_list_model.dart';
import 'package:pokedexapi/pokemon_model.dart';
import 'package:pokedexapi/pokemon_provider.dart';

class PokemonService {
  PokemonProvider _pokemonProvider = new PokemonProvider();

  Future<PokemonListModel> getPokemonList() {
    return _pokemonProvider.getPokemonList();
  }


  Future<PokemonModel> getPokemonModel(String page) {
    return _pokemonProvider.getPokemonModel(page);
  }
}
