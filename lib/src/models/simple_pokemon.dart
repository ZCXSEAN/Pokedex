enum Types {
  bug,
  dragon,
  dark,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  unknown,
  water
}

class SimplePokemon {
  final int id;
  final String name;
  final List<String> types;

  SimplePokemon({required this.id, required this.name, required this.types});

  factory SimplePokemon.fromJson(Map<String, dynamic> json) {
    return SimplePokemon(
      id: json['id'],
      name: json['name'],
      types: List<String>.from(json['types']),
    );
  }
}
