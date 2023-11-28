import 'package:flutter/material.dart';
import 'package:pokedex/src/bloc/simple_pokemon_list/simple_pokemon_list_bloc.dart';
import 'package:pokedex/src/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Data Load Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: BlocProvider(
        create: (context) =>
            SimplePokemonListBloc()..add(LoadSimplePokemonList()),
        child: const MainPage(),
      ),
    );
  }
}
