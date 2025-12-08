import 'package:flutter/material.dart';
import '../models/prayer_model.dart';

class PrayerService extends ChangeNotifier {
  List<PrayerModel> _prayers = [];
  String _currentLocation = 'Sylhet';
  String _currentDate = '08 August, 2022';
  String _currentPrayer = 'Dhuhr';
  String _nextPrayer = 'Asr';

  List<PrayerModel> get prayers => _prayers;
  String get currentLocation => _currentLocation;
  String get currentDate => _currentDate;
  String get currentPrayer => _currentPrayer;
  String get nextPrayer => _nextPrayer;

  PrayerService() {
    _initializePrayers();
  }

  void _initializePrayers() {
    _prayers = [
      PrayerModel(
        name: 'Ishmak',
        time: '03:56 AM',
        isCurrent: false,
        arabicName: 'إشراق',
      ),
      PrayerModel(
        name: 'Fajr',
        time: '04:26 AM',
        isCurrent: false,
        arabicName: 'الفجر',
      ),
      PrayerModel(
        name: 'Dhuhr',
        time: '11:58 AM',
        isCurrent: true,
        arabicName: 'الظهر',
      ),
      PrayerModel(
        name: 'Asr',
        time: '03:25 PM',
        isCurrent: false,
        arabicName: 'العصر',
      ),
      PrayerModel(
        name: 'Maghrib',
        time: '06:15 PM',
        isCurrent: false,
        arabicName: 'المغرب',
      ),
      PrayerModel(
        name: 'Isha',
        time: '07:50 PM',
        isCurrent: false,
        arabicName: 'العشاء',
      ),
    ];
    notifyListeners();
  }

  void updateLocation(String location) {
    _currentLocation = location;
    notifyListeners();
  }

  void updateDate(String date) {
    _currentDate = date;
    notifyListeners();
  }

  void setCurrentPrayer(String prayer) {
    _currentPrayer = prayer;
    // Update prayer status
    for (var prayer in _prayers) {
      prayer.isCurrent = (prayer.name == _currentPrayer);
    }
    notifyListeners();
  }
}
