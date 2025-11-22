class PrayerModel {
  final String name;
  final String time;
  bool isCurrent;
  final bool hasNotification;
  final String arabicName;

  PrayerModel({
    required this.name,
    required this.time,
    this.isCurrent = false,
    this.hasNotification = true,
    required this.arabicName,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      name: json['name'] ?? '',
      time: json['time'] ?? '',
      isCurrent: json['isCurrent'] ?? false,
      hasNotification: json['hasNotification'] ?? true,
      arabicName: json['arabicName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time,
      'isCurrent': isCurrent,
      'hasNotification': hasNotification,
      'arabicName': arabicName,
    };
  }
}

class PrayerTimingData {
  final String date;
  final String location;
  final List<PrayerModel> prayers;
  final String currentPrayer;
  final String nextPrayer;

  PrayerTimingData({
    required this.date,
    required this.location,
    required this.prayers,
    required this.currentPrayer,
    required this.nextPrayer,
  });

  factory PrayerTimingData.fromJson(Map<String, dynamic> json) {
    return PrayerTimingData(
      date: json['date'] ?? '',
      location: json['location'] ?? '',
      prayers:
          (json['prayers'] as List?)
              ?.map((prayer) => PrayerModel.fromJson(prayer))
              .toList() ??
          [],
      currentPrayer: json['currentPrayer'] ?? '',
      nextPrayer: json['nextPrayer'] ?? '',
    );
  }
}
