import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/persistent_bottom_nav.dart';

class SiyamTimingScreen extends StatelessWidget {
  const SiyamTimingScreen({super.key});

  void _navigateToMainScreen(BuildContext context, int index) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    // Sample salah times
    final salahTimes = [
      {'name': 'Fajr', 'time': '05:15 AM', 'arabic': 'الفجر'},
      {'name': 'Dhuhr', 'time': '12:30 PM', 'arabic': 'الظهر'},
      {'name': 'Asr', 'time': '04:00 PM', 'arabic': 'العصر'},
      {'name': 'Maghrib', 'time': '06:45 PM', 'arabic': 'المغرب'},
      {'name': 'Isha', 'time': '08:15 PM', 'arabic': 'العشاء'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.salahTiming),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Today's Date Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF2196F3),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Today: 09 Muharram, 1444',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212121),
                    ),
                  ),
                ],
              ),
            ),
            // Salah Times List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: 100,
                ),
                itemCount: salahTimes.length,
                itemBuilder: (context, index) {
                  final salah = salahTimes[index];
                  return _buildSalahCard(salah, index == 2); // Mark Asr as current
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
    );
  }

  Widget _buildSalahCard(Map<String, String> salah, bool isCurrent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCurrent ? const Color(0xFF2196F3) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                salah['name']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isCurrent ? Colors.white : const Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                salah['arabic']!,
                style: TextStyle(
                  fontSize: 16,
                  color: isCurrent ? Colors.white70 : const Color(0xFF757575),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                salah['time']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isCurrent ? Colors.white : const Color(0xFF2196F3),
                ),
              ),
              if (isCurrent)
                const Text(
                  'Current',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
