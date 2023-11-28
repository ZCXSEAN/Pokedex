import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/src/models/models.dart';

part 'simple_pokemon_list_event.dart';
part 'simple_pokemon_list_state.dart';

class SimplePokemonListBloc
    extends Bloc<SimplePokemonListEvent, SimplePokemonListState> {
  SimplePokemonListBloc() : super(SimplePokemonListInitial()) {
    on<LoadSimplePokemonList>((event, emit) async {
      emit(SimplePokemonListLoading());
      List<List<SimplePokemon>> lists = await loadAllPokemons();
      emit(SimplePokemonListLoaded(lists[0], lists[1], lists[2], lists[3],
          lists[4], lists[5], lists[6], lists[7], lists[8], lists[9]));
    });
  }

  Future<List<List<SimplePokemon>>> loadAllPokemons() async {
    final String jsonString =
        await rootBundle.loadString('assets/pokemon/simple_pokemon_list.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    var futures = <Future<List<SimplePokemon>>>[];
    futures.add(loadGen1(jsonMap));
    futures.add(loadGen2(jsonMap));
    futures.add(loadGen3(jsonMap));
    futures.add(loadGen4(jsonMap));
    futures.add(loadGen5(jsonMap));
    futures.add(loadGen6(jsonMap));
    futures.add(loadGen7(jsonMap));
    futures.add(loadGen8(jsonMap));
    futures.add(loadGen9(jsonMap));
    futures.add(loadSpList(jsonMap));
    return await Future.wait(futures);
  }

  Future<List<SimplePokemon>> loadGen1(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen1List = jsonMap['gen_1_list'];
    List<SimplePokemon> list =
        gen1List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen2(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen2List = jsonMap['gen_2_list'];
    List<SimplePokemon> list =
        gen2List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen3(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen3List = jsonMap['gen_3_list'];
    List<SimplePokemon> list =
        gen3List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen4(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen4List = jsonMap['gen_4_list'];
    List<SimplePokemon> list =
        gen4List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen5(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen5List = jsonMap['gen_5_list'];
    List<SimplePokemon> list =
        gen5List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen6(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen6List = jsonMap['gen_6_list'];
    List<SimplePokemon> list =
        gen6List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen7(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen7List = jsonMap['gen_7_list'];
    List<SimplePokemon> list =
        gen7List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen8(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen8List = jsonMap['gen_8_list'];
    List<SimplePokemon> list =
        gen8List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadGen9(Map<String, dynamic> jsonMap) async {
    final List<dynamic> gen9List = jsonMap['gen_9_list'];
    List<SimplePokemon> list =
        gen9List.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }

  Future<List<SimplePokemon>> loadSpList(Map<String, dynamic> jsonMap) async {
    final List<dynamic> spList = jsonMap['special_list'];
    List<SimplePokemon> list =
        spList.map((jsonItem) => SimplePokemon.fromJson(jsonItem)).toList();
    return list;
  }
}
