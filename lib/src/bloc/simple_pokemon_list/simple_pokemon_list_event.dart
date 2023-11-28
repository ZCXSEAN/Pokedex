part of 'simple_pokemon_list_bloc.dart';

sealed class SimplePokemonListEvent extends Equatable {
  const SimplePokemonListEvent();

  @override
  List<Object> get props => [];
}

final class LoadSimplePokemonList extends SimplePokemonListEvent {}
