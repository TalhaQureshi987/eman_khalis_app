import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/prayer_service.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/current_prayer_card.dart';
import 'features_screen.dart';
import 'siyam_timing_screen.dart';
import 'youtube_videos_screen.dart';
import 'tafseer_screen.dart';
import 'hablullah_screen.dart';
import 'notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFF5F7FA), Color(0xFFE8F5E8)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top Bar with enhanced styling
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        const Color(0xFF2196F3).withOpacity(0.02),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2196F3).withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFE8F5E8), Color(0xFFC8E6C9)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF2196F3,
                                  ).withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: Color(0xFF2196F3),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  '09 Muharram, 1444',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF2196F3),
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Consumer<PrayerService>(
                            builder: (context, prayerService, child) {
                              return Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF2196F3,
                                      ).withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF2196F3),
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    prayerService.currentLocation,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Color(0xFF2196F3),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Current Prayer Card
                const CurrentPrayerCard(),

                // Spacer to push buttons to bottom
                const SizedBox(height: 16),

                // Decorative divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                const Color(0xFF2196F3).withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Color(0xFF2196F3),
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                const Color(0xFF2196F3).withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Section Title with enhanced design
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 24,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                          ),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2196F3).withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        localizations.quickAccess,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF212121),
                          letterSpacing: 0.5,
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
                ),

                // Buttons: Features, YouTube Videos, Tafseer, Hablullah, Kitabchay
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    top: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // First Row: Features, YouTube Videos, Tafseer (3 buttons)
                      Row(
                        children: [
                          Expanded(child: _buildFeaturesButton(context)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _buildAdditionalButton(
                              context,
                              localizations.ytVideos,
                              Icons.play_circle_outline,
                              () {
                                // Navigate to YouTube Videos Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const YouTubeVideosScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _buildAdditionalButton(
                              context,
                              localizations.tafseer,
                              Icons.menu_book_outlined,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TafseerScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Second Row: Hablullah, Notes, and Salah Timing (3 buttons, same size as upper row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildAdditionalButton(
                              context,
                              localizations.hablullah,
                              Icons.link,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HablullahScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _buildAdditionalButton(
                              context,
                              localizations.notes,
                              Icons.note_outlined,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NotesScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _buildAdditionalButton(
                              context,
                              localizations.salahTiming,
                              Icons.access_time,
                              () {
                                // Navigate to Salah Timing Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SiyamTimingScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to Features Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FeaturesScreen()),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, const Color(0xFF2196F3).withOpacity(0.02)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2196F3).withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFE8F5E8), Color(0xFFC8E6C9)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2196F3).withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.apps,
                  color: Color(0xFF2196F3),
                  size: 18,
                ),
              ),
              const SizedBox(height: 6),
              Builder(
                builder: (context) {
                  final languageService = Provider.of<LanguageService>(context);
                  final localizations = AppLocalizations(
                    languageService.currentLanguage,
                  );
                  return Text(
                    localizations.features,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212121),
                      letterSpacing: 0.2,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, const Color(0xFF2196F3).withOpacity(0.02)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2196F3).withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFE8F5E8), Color(0xFFC8E6C9)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2196F3).withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, color: const Color(0xFF2196F3), size: 18),
              ),
              const SizedBox(height: 6),
              Text(
                _toTitleCase(title),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
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
      ),
    );
  }

  String _toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }
}
