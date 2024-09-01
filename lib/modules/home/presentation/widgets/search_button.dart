import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/dialog_pokemon_stats.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, value: 0, duration: const Duration(milliseconds: 500));

  final focusNode = FocusNode();

  double width = 0;

  bool showing = false;

  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: showing ? MediaQuery.of(context).size.width * 0.6 : 0,
            height: 35,
            curve: Curves.ease,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 12),
              child: TextField(
                focusNode: focusNode,
                style: const TextStyle(decorationThickness: 0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (value) async {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();

                  _debounce = Timer(const Duration(milliseconds: 500), () async {
                    if (value.isEmpty) return;

                    final result = await getIt.get<SearchPokemonStore>().getPokemon(value);

                    result.fold(
                      (failure) {},
                      (pokemon) {
                        DialogPokemonStats.show(context, pokemon);
                      },
                    );
                  });
                },
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -6,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (showing) {
                  showing = false;
                  _controller.reverse();
                  focusNode.unfocus();
                } else {
                  showing = true;
                  _controller.forward();
                  focusNode.requestFocus();
                }
              });
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.ellipsis_search,
              progress: _controller,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
