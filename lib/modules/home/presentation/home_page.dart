import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/home_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/dialog_pokemon_stats.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = getIt.get<HomeStore>()..fetch();
  final seachPokemonStore = getIt.get<SearchPokemonStore>();

  late ScrollController scrollController = ScrollController()
    ..addListener(() {
      if (scrollController.position.atEdge) {
        bool isBottom = scrollController.position.pixels != 0;
        if (isBottom) {
          homeStore.nextPage();
        }
      }
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokedex",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        actions: [
          SearchButton(),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 22,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Observer(
                builder: (context) {
                  return Wrap(
                    children: [
                      for (final pokemon in homeStore.pokemonBaseList)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              final result = await seachPokemonStore.getPokemon(pokemon.name);

                              result.fold(
                                (failure) {},
                                (pokemon) {
                                  DialogPokemonStats.show(context, pokemon);
                                },
                              );
                            },
                            child: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'pokemon-${pokemon.name}',
                                      child: Image.network(
                                        "https://img.pokemondb.net/artwork/${pokemon.name}.jpg",
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        height: MediaQuery.of(context).size.width * 0.2,
                                        fit: BoxFit.scaleDown,
                                        colorBlendMode: BlendMode.multiply,
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      pokemon.name,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
