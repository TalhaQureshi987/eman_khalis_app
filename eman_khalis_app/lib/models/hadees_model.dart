class HadeesModel {
  final int number;
  final String arabicText;
  final String englishText;
  final String narrator;
  final String collection;
  final String chapter;
  final String bab; // Chapter/Bab name
  final int jild; // Volume number
  final bool isFavorite;

  HadeesModel({
    required this.number,
    required this.arabicText,
    required this.englishText,
    required this.narrator,
    required this.collection,
    required this.chapter,
    required this.bab,
    required this.jild,
    this.isFavorite = false,
  });

  factory HadeesModel.fromJson(Map<String, dynamic> json) {
    return HadeesModel(
      number: json['number'] ?? 0,
      arabicText: json['arabicText'] ?? '',
      englishText: json['englishText'] ?? '',
      narrator: json['narrator'] ?? '',
      collection: json['collection'] ?? '',
      chapter: json['chapter'] ?? '',
      bab: json['bab'] ?? '',
      jild: json['jild'] ?? 1,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

