import 'package:flutter/material.dart';
import 'package:pokedexapi/pokemon_detail_screen.dart';
import 'package:pokedexapi/pokemon_list_model.dart';
import 'package:pokedexapi/pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PokemonService pokemonService = PokemonService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: pokemonService.getPokemonList(),
          builder: (context, AsyncSnapshot<PokemonListModel> snapshot) {
            if (snapshot.hasData) {
              PokemonListModel lists = snapshot.data!;
              return ListView(
                children: lists.results!
                    .map((PokemonListitem e) => ListTile(
                          onTap: () {
                            String url = e.url!;
                            String cuturl = url.replaceAll(
                                "https://pokeapi.co/api/v2/pokemon/", "");
                            String page = cuturl.replaceAll("/", "");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokemonDetailScreen(
                                          title: e.name!,
                                          url: e.url!,
                                          page: page,
                                        )));
                          },
                          title: Text(e.name!),
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
        );
  }
}
