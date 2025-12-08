import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../screens/qibla_screen.dart';
import '../screens/siyam_timing_screen.dart';
import '../screens/dua_screen.dart';
import '../screens/hajj_umrah_screen.dart';
import '../screens/asma_ul_husna_screen.dart';
import '../screens/quran_screen.dart';
import '../screens/hadees_screen.dart';

class FeatureGrid extends StatefulWidget {
  const FeatureGrid({super.key});

  @override
  State<FeatureGrid> createState() => FeatureGridState();
}

class FeatureGridState extends State<FeatureGrid> {
  bool _isExpanded = false;

  void toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'name': AppStrings.alQuran,
        'icon': Icons.menu_book,
        'screen': const QuranScreen(),
      },
      {
        'name': AppStrings.alHadith,
        'icon': Icons.library_books,
        'screen': const HadeesScreen(),
      },
      {
        'name': AppStrings.asmaUlHusna,
        'icon': Icons.star,
        'screen': const AsmaUlHusnaScreen(),
      },
      {
        'name': AppStrings.qiblaCompass,
        'icon': Icons.explore,
        'screen': const QiblaScreen(),
      },
      {
        'name': AppStrings.siyamTiming,
        'icon': Icons.nights_stay,
        'screen': const SiyamTimingScreen(),
      },
      {
        'name': AppStrings.duaForEveryday,
        'icon': Icons.favorite_border,
        'screen': const DuaScreen(),
      },
      {
        'name': AppStrings.hajjUmrah,
        'icon': Icons.location_city,
        'screen': const HajjUmrahScreen(),
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: _isExpanded
          ? Column(
              children: [
                const SizedBox(height: 8),
                // Expanded grid - scrollable in background
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 200,
                    ), // Space for buttons at bottom
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      final feature = features[index];
                      return _buildFeatureCard(
                        context,
                        feature['name'] as String,
                        feature['icon'] as IconData,
                        feature['screen'] as Widget?,
                      );
                    },
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(), // Hide when collapsed (button is in home screen)
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String name,
    IconData icon,
    Widget? screen,
  ) {
    return GestureDetector(
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFF2196F3), size: 20),
            ),
            const SizedBox(height: 11),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
                letterSpacing: 0.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
