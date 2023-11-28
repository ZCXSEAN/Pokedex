part of 'simple_pokemon_list_bloc.dart';

sealed class SimplePokemonListState {}

final class SimplePokemonListInitial extends SimplePokemonListState {}

final class SimplePokemonListLoading extends SimplePokemonListState {}

final class SimplePokemonListLoaded extends SimplePokemonListState {
  final List<SimplePokemon> list1;
  final List<SimplePokemon> list2;
  final List<SimplePokemon> list3;
  final List<SimplePokemon> list4;
  final List<SimplePokemon> list5;
  final List<SimplePokemon> list6;
  final List<SimplePokemon> list7;
  final List<SimplePokemon> list8;
  final List<SimplePokemon> list9;
  final List<SimplePokemon> listSp;

  SimplePokemonListLoaded(this.list1, this.list2, this.list3, this.list4,
      this.list5, this.list6, this.list7, this.list8, this.list9, this.listSp);
}
final class TestListLoaded extends SimplePokemonListState {
  final List<String> list1;
  final List<String> list2;
  final List<String> list3;
  final List<String> list4;
  final List<String> list5;
  final List<String> list6;
  final List<String> list7;
  final List<String> list8;
  final List<String> list9;
  final List<String> listSp;

  TestListLoaded(this.list1, this.list2, this.list3, this.list4,
      this.list5, this.list6, this.list7, this.list8, this.list9, this.listSp);
}
