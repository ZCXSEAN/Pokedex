import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/pages/home/card_list_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:pokedex/src/bloc/simple_pokemon_list/simple_pokemon_list_bloc.dart';
import 'package:pokedex/src/models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        navigationBar: const CupertinoNavigationBar(
          middle: Text('PokeDex'),
        ),
        child: BlocBuilder<SimplePokemonListBloc, SimplePokemonListState>(
          builder: (context, state) {
            if (state is SimplePokemonListLoading) {
              // 如果状态是ListLoading，显示加载指示器和文本
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 8),
                    Text('Loading...'),
                  ],
                ),
              );
            } else if (state is SimplePokemonListLoaded) {
              // 如果状态是ListLoaded，显示列表
              final List<List<SimplePokemon>> lists = [];
              lists.add(state.list1);
              lists.add(state.list2);
              lists.add(state.list3);
              lists.add(state.list4);
              lists.add(state.list5);
              lists.add(state.list6);
              lists.add(state.list7);
              lists.add(state.list8);
              lists.add(state.list9);
              lists.add(state.listSp);

              return CardListPage(lists: lists);
            }
            // 如果是其他状态，比如初始状态，可以返回一个空的Container或者其他的占位符
            return Container();
          },
        ));
  }
}
