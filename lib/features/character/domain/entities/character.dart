class Character {
  final String name;
  final String status;
  final String species;
  final String image;
  final String lastKnownLocation;
  final String firstSeenIn;

  const Character({
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.lastKnownLocation,
    required this.firstSeenIn,
  });

  void operator [](String other) {}
}
