import 'package:flutter/material.dart';

class QuranTabs extends StatefulWidget {
  const QuranTabs({super.key});

  @override
  State<QuranTabs> createState() => _QuranTabsState();
}

class _QuranTabsState extends State<QuranTabs> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    'BY SURAH',
    'BY PARAH',
    'FAVOURITE',
    'BOOKMARK',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = _selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Text(
                      tab,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                        fontSize: 13,
                        color: isSelected ? const Color(0xFF2196F3) : const Color(0xFF757575),
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (isSelected)
                      Container(
                        width: 30,
                        height: 3,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3), // Green underline
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
