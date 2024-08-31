import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String name;
  final int hp;
  final int attack;
  final int defense;

  const PokemonEntity({
    required this.name,
    required this.hp,
    required this.attack,
    required this.defense,
  });

  @override
  List<Object?> get props => [
        name,
        hp,
        attack,
        defense,
      ];
}
