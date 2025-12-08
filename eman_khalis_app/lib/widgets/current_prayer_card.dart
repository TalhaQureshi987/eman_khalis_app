import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/prayer_service.dart';
import '../screens/prayer_timing_screen.dart';

class CurrentPrayerCard extends StatelessWidget {
  const CurrentPrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PrayerTimingScreen(),
            ),
          );
        },
        child: Consumer<PrayerService>(
          builder: (context, prayerService, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ISHA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2196F3),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Current Prayer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildTimeCard(context, 'START', '07:50 PM'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTimeCard(context, 'END', '09:50 PM'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimeCard(BuildContext context, String label, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
