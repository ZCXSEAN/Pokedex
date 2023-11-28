import 'package:flutter/cupertino.dart';

class PokemonDetailPage extends StatelessWidget {
  final int id;
  const PokemonDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Pokemon Detail'),),
      child: Center(
        child: Text(
          id.toString(),
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
