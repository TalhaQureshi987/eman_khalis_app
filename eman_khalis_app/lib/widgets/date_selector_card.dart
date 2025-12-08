import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class DateSelectorCard extends StatelessWidget {
  const DateSelectorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Previous day
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2E7D32),
              size: 20,
            ),
          ),
          Column(
            children: [
              Text(
                AppStrings.today,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '08 August, 2022',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // Next day
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF2E7D32),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
