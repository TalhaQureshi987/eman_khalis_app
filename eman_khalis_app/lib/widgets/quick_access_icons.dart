import 'package:flutter/material.dart';

class QuickAccessIcons extends StatelessWidget {
  const QuickAccessIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final quickAccessItems = [
      {'name': 'Do & Don\'t', 'icon': Icons.block},
      {'name': 'Bookmarks', 'icon': Icons.bookmark_border},
      {'name': 'Notes', 'icon': Icons.note_outlined},
      {'name': 'FAQ', 'icon': Icons.help_outline},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: quickAccessItems.map((item) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle tap
              },
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: const Color(0xFF2196F3),
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['name'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

