class SurahModel {
  final int number;
  final String name;
  final String englishName;
  final String meaning;
  final String type; // Meccan or Medinan
  final int totalVerses;
  final String lastReadDate;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.meaning,
    required this.type,
    required this.totalVerses,
    this.lastReadDate = '',
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'] ?? 0,
      name: json['name'] ?? '',
      englishName: json['englishName'] ?? '',
      meaning: json['meaning'] ?? '',
      type: json['type'] ?? '',
      totalVerses: json['totalVerses'] ?? 0,
      lastReadDate: json['lastReadDate'] ?? '',
    );
  }
}

class LastReadSurah {
  final int surahNumber;
  final String surahName;
  final String lastReadDate;

  LastReadSurah({
    required this.surahNumber,
    required this.surahName,
    required this.lastReadDate,
  });
}
