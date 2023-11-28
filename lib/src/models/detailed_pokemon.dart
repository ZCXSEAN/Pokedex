class DetailedPokemon {
  final int id;
  final String name;
  final List<String> types;

  DetailedPokemon({required this.id, required this.name, required this.types});

  factory DetailedPokemon.fromJson(Map<String, dynamic> json) {
    return DetailedPokemon(
      id: json['id'],
      name: json['name'],
      types: List<String>.from(json['types']),
    );
  }
}