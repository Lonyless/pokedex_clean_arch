// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$pokemonBaseListAtom =
      Atom(name: 'HomeStoreBase.pokemonBaseList', context: context);

  @override
  List<PokemonBaseEntity> get pokemonBaseList {
    _$pokemonBaseListAtom.reportRead();
    return super.pokemonBaseList;
  }

  @override
  set pokemonBaseList(List<PokemonBaseEntity> value) {
    _$pokemonBaseListAtom.reportWrite(value, super.pokemonBaseList, () {
      super.pokemonBaseList = value;
    });
  }

  late final _$apiRequestStateAtom =
      Atom(name: 'HomeStoreBase.apiRequestState', context: context);

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

  late final _$failureAtom =
      Atom(name: 'HomeStoreBase.failure', context: context);

  @override
  Failure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  late final _$pageNumberAtom =
      Atom(name: 'HomeStoreBase.pageNumber', context: context);

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('HomeStoreBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
pokemonBaseList: ${pokemonBaseList},
apiRequestState: ${apiRequestState},
failure: ${failure},
pageNumber: ${pageNumber}
    ''';
  }
}
