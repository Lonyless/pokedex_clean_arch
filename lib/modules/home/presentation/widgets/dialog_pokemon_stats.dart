import 'package:flutter/material.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';

class DialogPokemonStats extends StatelessWidget {
  const DialogPokemonStats({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  static Future<void> show(BuildContext context, PokemonEntity pokemon) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, _, __) {
          return DialogPokemonStats(pokemon: pokemon);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: 'pokemon-${pokemon.name}',
                    child: Image.network(
                      "https://img.pokemondb.net/artwork/${pokemon.name}.jpg",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "HP",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 20,
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
                  width: (constraints.maxWidth * pokemon.hp) / 100,
                ),
                const SizedBox(height: 12),
                Text(
                  "Ataque",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 20,
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(6)),
                  width: (constraints.maxWidth * pokemon.attack) / 100,
                ),
                const SizedBox(height: 12),
                Text(
                  "Defesa",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: 20,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(6)),
                  width: (constraints.maxWidth * pokemon.defense) / 100,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
