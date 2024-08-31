import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math';
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart';

import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/home_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeStore = getIt.get<HomeStore>();

  final colorList = [
    Color(0xff68A890),
    Color(0xff498899),
    Color(0xffD7705F),
    Color(0xff9FB0D1),
    Color(0xff70B8C7),
  ];

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
                        Builder(
                          builder: (context) {
                            final color = colorList[Random().nextInt(4)].withOpacity(0.2);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      "https://img.pokemondb.net/artwork/${pokemon.name}.jpg",
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      height: MediaQuery.of(context).size.width * 0.2,
                                      colorBlendMode: BlendMode.multiply,
                                      color: color,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      pokemon.name,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
