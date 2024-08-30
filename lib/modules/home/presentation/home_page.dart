import 'package:flutter/material.dart';
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
      body: Column(
        children: [],
      ),
    );
  }
}
