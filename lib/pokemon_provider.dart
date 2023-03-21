import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedexapi/pokemon_list_model.dart';
import 'package:pokedexapi/pokemon_model.dart';

class PokemonProvider {
  get page => null;

  Future<PokemonListModel> getPokemonList() async {
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon');
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonListModel pModel = PokemonListModel.fromJSON(body);
      return pModel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }


  Future<PokemonModel> getPokemonModel(String page) async {
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon/' + page);
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonModel model = PokemonModel.fromJson(body);
      return model;
    } else {
      print("Can't get response from server");
      print(page);
      throw "Server exception";
    }
  }
}
