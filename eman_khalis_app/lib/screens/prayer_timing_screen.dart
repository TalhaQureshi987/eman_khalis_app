import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../services/prayer_service.dart';
import '../widgets/prayer_card.dart';
import '../widgets/date_selector_card.dart';
import '../widgets/persistent_bottom_nav.dart';

class PrayerTimingScreen extends StatelessWidget {
  const PrayerTimingScreen({super.key});

  void _navigateToMainScreen(BuildContext context, int index) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with white background
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF2196F3),
                        size: 20,
                      ),
                    ),
                    Text(
                      AppStrings.prayerTiming,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF212121),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ],
                ),
              ),

              // Date Selector Card
              const DateSelectorCard(),

              // Prayer List
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<PrayerService>(
                    builder: (context, prayerService, child) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 100,
                          left: 0,
                          right: 0,
                        ),
                        itemCount: prayerService.prayers.length,
                        itemBuilder: (context, index) {
                          final prayer = prayerService.prayers[index];
                          return PrayerCard(
                            prayer: prayer,
                            onNotificationToggle: (isEnabled) {
                              // Handle notification toggle
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
    );
  }
}
