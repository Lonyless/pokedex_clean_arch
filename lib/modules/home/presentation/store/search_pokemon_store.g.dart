// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPokemonStore on SearchPokemonStoreBase, Store {
  late final _$apiRequestStateAtom =
      Atom(name: 'SearchPokemonStoreBase.apiRequestState', context: context);

  @override
  ApiRequestState get apiRequestState {
    _$apiRequestStateAtom.reportRead();
    return super.apiRequestState;
  }

  @override
  set apiRequestState(ApiRequestState value) {
    _$apiRequestStateAtom.reportWrite(value, super.apiRequestState, () {
      super.apiRequestState = value;
    });
  }

  late final _$getPokemonAsyncAction =
      AsyncAction('SearchPokemonStoreBase.getPokemon', context: context);

  @override
  Future<Either<Failure, PokemonEntity>> getPokemon(String name) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(name));
  }

  @override
  String toString() {
    return '''
apiRequestState: ${apiRequestState}
    ''';
  }
}
