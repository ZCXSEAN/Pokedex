import 'package:flutter/material.dart';
import 'package:pokedex/src/models/models.dart';

class IndexCard extends StatelessWidget {
  final SimplePokemon pokemon;
  const IndexCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), // 设置圆角的大小
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8), // 设置内部padding,
          child: ListTile(
              leading: Image.asset('assets/pokemon/artwork/${pokemon.id}.png'),
              title: _buildBasicInfo(context, pokemon)),
        ));
  }

  Widget _buildBasicInfo(BuildContext context, SimplePokemon pokemon) {
    List<String> types = pokemon.types;
    double imageWidth = 75;
    double marginWidth = 8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '#${pokemon.id}',
              textScaleFactor: 0.7,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(width: marginWidth),
            Text(
              '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
              textScaleFactor: 0.8,
            ),
          ],
        ),
        SizedBox(height: marginWidth),
        Row(
          children: types.asMap().entries.map((entry) {
            String e = entry.value;
            String url = 'assets/pokemon/type_icon/$e.png';
            Widget img;
            try{
              img =  Image.asset(url, fit: BoxFit.scaleDown);
            }catch(e){
              img = Image.asset('assets/pokemon/type_icon/1.png', fit: BoxFit.scaleDown);
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: imageWidth,
                  child: img,
                ),
                SizedBox(width: marginWidth),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
