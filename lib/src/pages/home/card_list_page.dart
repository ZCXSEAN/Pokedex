import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/models/models.dart';
import 'package:pokedex/src/pages/home/pokemon_detail_page.dart';
import 'package:pokedex/src/widgets/widgets.dart';

class CardListPage extends StatefulWidget {
  final List<List<SimplePokemon>> lists;
  const CardListPage({super.key, required this.lists});

  @override
  State<CardListPage> createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToIndex(int index) {
    final double position = index * 80.0;
    _scrollController.animateTo(
      position,
      duration: const Duration(seconds: 1), // 滚动动画持续时间
      curve: Curves.easeInOut, // 滚动动画的曲线
    );
  }

  @override
  Widget build(BuildContext context) {
    goToDetailPage(id) {
      // 使用navigatorKey进行页面跳转
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => PokemonDetailPage(id: id),
        ),
      );
    }

    Widget gen1List = Column(
      children: widget.lists[0]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen2List = Column(
      children: widget.lists[1]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen3List = Column(
      children: widget.lists[2]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen4List = Column(
      children: widget.lists[3]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen5List = Column(
      children: widget.lists[4]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen6List = Column(
      children: widget.lists[5]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen7List = Column(
      children: widget.lists[6]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen8List = Column(
      children: widget.lists[7]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget gen9List = Column(
      children: widget.lists[8]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );
    Widget spList = Column(
      children: widget.lists[9]
          .map((pokemon) => GestureDetector(
                onTap: () {
                  goToDetailPage(pokemon.id);
                },
                child: IndexCard(pokemon: pokemon),
              ))
          .toList(),
    );

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: ListView(
            controller: _scrollController,
            children: [
              gen1List,
              gen2List,
              gen3List,
              gen4List,
              gen5List,
              gen6List,
              gen7List,
              gen8List,
              gen9List,
              spList
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              '第一世代',
              '第二世代',
              '第三世代',
              '第四世代',
              '第五世代',
              '第六世代',
              '第七世代',
              '第八世代',
              '第九世代',
              '特殊',
            ].map((e) {
              int index = 1;
              String description = '';
              switch (e) {
                case '第一世代':
                  index = 1;
                  description = '关都';
                  break;
                case '第二世代':
                  index = 152;
                  description = '城都';
                  break;
                case '第三世代':
                  index = 252;
                  description = '丰缘';
                  break;
                case '第四世代':
                  index = 387;
                  description = '神奥';
                  break;
                case '第五世代':
                  index = 494;
                  description = '合众';
                  break;
                case '第六世代':
                  index = 650;
                  description = '卡洛斯';
                  break;
                case '第七世代':
                  index = 722;
                  description = '阿罗拉';
                  break;
                case '第八世代':
                  index = 810;
                  description = '伽勒尔/洗翠';
                  break;
                case '第九世代':
                  index = 906;
                  description = '朱/紫';
                  break;
                case '特殊':
                  index = 1018;
                  description = '朱/紫';
                  break;
                default:
                  index = 1;
              }

              return InkWell(
                onTap: () => _scrollToIndex(index - 1),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 3, 15),
                    child: Column(
                      children: [
                        Text(
                          e,
                          textScaleFactor: 0.85,
                        ),
                        Text(
                          description,
                          textScaleFactor: 0.7,
                          style: TextStyle(color: Colors.grey[400]),
                        )
                      ],
                    )),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
