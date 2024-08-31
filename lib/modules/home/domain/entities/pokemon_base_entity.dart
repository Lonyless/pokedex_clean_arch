import 'package:equatable/equatable.dart';

class PokemonBaseEntity extends Equatable {
  final String name;
  final String url;

  const PokemonBaseEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
