import 'package:flutter/material.dart';
import '../models/prayer_model.dart';

class PrayerCard extends StatelessWidget {
  final PrayerModel prayer;
  final Function(bool) onNotificationToggle;

  const PrayerCard({
    super.key,
    required this.prayer,
    required this.onNotificationToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: prayer.isCurrent
            ? Border.all(color: const Color(0xFF2196F3), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Prayer Status Circle
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: prayer.isCurrent
                  ? const Color(0xFF2196F3)
                  : const Color(0xFFBDBDBD),
            ),
          ),
          const SizedBox(width: 16),

          // Prayer Name
          Expanded(
            child: Text(
              prayer.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: prayer.isCurrent
                    ? const Color(0xFF2E7D32)
                    : const Color(0xFF212121),
              ),
            ),
          ),

          // Prayer Time
          Text(
            prayer.time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: prayer.isCurrent
                  ? const Color(0xFF2E7D32)
                  : const Color(0xFF212121),
            ),
          ),
          const SizedBox(width: 16),

          // Notification Bell
          GestureDetector(
            onTap: () => onNotificationToggle(!prayer.hasNotification),
            child: Icon(
              prayer.hasNotification
                  ? Icons.notifications_outlined
                  : Icons.notifications_off_outlined,
              color: const Color(0xFF757575),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
