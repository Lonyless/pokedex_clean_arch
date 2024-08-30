// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../modules/home/data/datasources/pokemon_datasource.dart' as _i752;
import '../modules/home/data/repositories/pokemon_repository_impl.dart'
    as _i779;
import '../modules/home/domain/repositories/pokemon_repository.dart' as _i674;
import '../modules/home/domain/usecases/fetch_pokemon_base_list.dart' as _i548;
import '../modules/home/presentation/store/home_store.dart' as _i801;
import 'http/pokedex_http.dart' as _i651;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i651.PokedexHttp>(() => _i651.PokedexHttp());
    gh.lazySingleton<_i752.PokemonDatasource>(
        () => _i752.PokemonDatasourceImpl(gh<_i651.PokedexHttp>()));
    gh.lazySingleton<_i674.PokemonRepository>(
        () => _i779.PokemonRepositoryImpl(gh<_i752.PokemonDatasource>()));
    gh.lazySingleton<_i548.FetchPokemonBaseList>(
        () => _i548.FetchPokemonBaseListImpl(gh<_i674.PokemonRepository>()));
    gh.factory<_i801.HomeStore>(
        () => _i801.HomeStore(gh<_i548.FetchPokemonBaseList>()));
    return this;
  }
}
