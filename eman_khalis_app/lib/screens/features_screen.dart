import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../screens/qibla_screen.dart';
import '../screens/dua_screen.dart';
import '../screens/hajj_umrah_screen.dart';
import '../screens/asma_ul_husna_screen.dart';
import '../screens/quran_screen.dart';
import '../screens/hadees_screen.dart';
import '../widgets/persistent_bottom_nav.dart';
import '../screens/main_navigation_screen.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    final features = [
      {
        'name': localizations.alQuran,
        'icon': Icons.menu_book,
        'screen': const QuranScreen(),
      },
      {
        'name': localizations.alHadith,
        'icon': Icons.library_books,
        'screen': const HadeesScreen(),
      },
      {
        'name': localizations.asmaUlHusna,
        'icon': Icons.star,
        'screen': const AsmaUlHusnaScreen(),
      },
      {
        'name': localizations.qiblaCompass,
        'icon': Icons.explore,
        'screen': const QiblaScreen(),
      },
      {
        'name': localizations.dua,
        'icon': Icons.favorite_border,
        'screen': const DuaScreen(),
      },
      {
        'name': localizations.hajjUmrah,
        'icon': Icons.location_city,
        'screen': const HajjUmrahScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF2196F3).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2196F3),
              size: 18,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
                      Text(
                        localizations.features,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF212121),
                          letterSpacing: 0.5,
                        ),
                      ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color(0xFF2196F3).withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF8F9FA),
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 24, bottom: 20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF2196F3),
                          Color(0xFF64B5F6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2196F3).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              localizations.features,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizations.changeAppLanguage,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Features Grid Title
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        localizations.features,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF212121),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '6',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2196F3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // First Row: 3 features
                  Row(
                    children: [
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[0]['name'] as String,
                          features[0]['icon'] as IconData,
                          features[0]['screen'] as Widget?,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[1]['name'] as String,
                          features[1]['icon'] as IconData,
                          features[1]['screen'] as Widget?,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[2]['name'] as String,
                          features[2]['icon'] as IconData,
                          features[2]['screen'] as Widget?,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Second Row: 3 features
                  Row(
                    children: [
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[3]['name'] as String,
                          features[3]['icon'] as IconData,
                          features[3]['screen'] as Widget?,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[4]['name'] as String,
                          features[4]['icon'] as IconData,
                          features[4]['screen'] as Widget?,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildFeatureCard(
                          context,
                          features[5]['name'] as String,
                          features[5]['icon'] as IconData,
                          features[5]['screen'] as Widget?,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Additional Info Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF2196F3).withOpacity(0.2),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2196F3).withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2196F3).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            color: Color(0xFF2196F3),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Need Help?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF212121),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tap on any feature to explore more',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home index
        onTap: (index) {
          // Navigate to main navigation screen with selected tab
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MainNavigationScreen(initialIndex: index),
            ),
            (route) => false,
          );
        },
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String name,
    IconData icon,
    Widget? screen,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (screen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                const Color(0xFF2196F3).withOpacity(0.02),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2196F3).withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
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
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFE8F5E8),
                      Color(0xFFC8E6C9),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2196F3).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(icon, color: const Color(0xFF2196F3), size: 22),
              ),
              const SizedBox(height: 8),
              Text(
                _toTitleCase(name),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212121),
                  letterSpacing: 0.2,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}

