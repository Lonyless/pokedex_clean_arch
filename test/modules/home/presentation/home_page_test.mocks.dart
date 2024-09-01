// Mocks generated by Mockito 5.4.4 from annotations
// in pokedex_clean_arch/test/modules/home/presentation/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mobx/mobx.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart' as _i6;
import 'package:pokedex_clean_arch/core/failures/failure.dart' as _i7;
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart'
    as _i5;
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart'
    as _i10;
import 'package:pokedex_clean_arch/modules/home/presentation/store/home_store.dart'
    as _i4;
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeObservableList_0<T> extends _i1.SmartFake
    implements _i2.ObservableList<T> {
  _FakeObservableList_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_1 extends _i1.SmartFake
    implements _i2.ReactiveContext {
  _FakeReactiveContext_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeStore extends _i1.Mock implements _i4.HomeStore {
  MockHomeStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ObservableList<_i5.PokemonBaseEntity> get pokemonBaseList =>
      (super.noSuchMethod(
        Invocation.getter(#pokemonBaseList),
        returnValue: _FakeObservableList_0<_i5.PokemonBaseEntity>(
          this,
          Invocation.getter(#pokemonBaseList),
        ),
      ) as _i2.ObservableList<_i5.PokemonBaseEntity>);

  @override
  set pokemonBaseList(_i2.ObservableList<_i5.PokemonBaseEntity>? value) =>
      super.noSuchMethod(
        Invocation.setter(
          #pokemonBaseList,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.ApiRequestState get apiRequestState => (super.noSuchMethod(
        Invocation.getter(#apiRequestState),
        returnValue: _i6.ApiRequestState.initial,
      ) as _i6.ApiRequestState);

  @override
  set apiRequestState(_i6.ApiRequestState? value) => super.noSuchMethod(
        Invocation.setter(
          #apiRequestState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set failure(_i7.Failure? value) => super.noSuchMethod(
        Invocation.setter(
          #failure,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get pageNumber => (super.noSuchMethod(
        Invocation.getter(#pageNumber),
        returnValue: 0,
      ) as int);

  @override
  set pageNumber(int? value) => super.noSuchMethod(
        Invocation.setter(
          #pageNumber,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_1(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  void nextPage() => super.noSuchMethod(
        Invocation.method(
          #nextPage,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> fetch() => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [SearchPokemonStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchPokemonStore extends _i1.Mock
    implements _i9.SearchPokemonStore {
  MockSearchPokemonStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_1(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  _i8.Future<_i3.Either<_i7.Failure, _i10.PokemonEntity>> getPokemon(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemon,
          [name],
        ),
        returnValue:
            _i8.Future<_i3.Either<_i7.Failure, _i10.PokemonEntity>>.value(
                _FakeEither_2<_i7.Failure, _i10.PokemonEntity>(
          this,
          Invocation.method(
            #getPokemon,
            [name],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i7.Failure, _i10.PokemonEntity>>);
}