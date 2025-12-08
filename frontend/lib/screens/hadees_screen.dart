import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../constants/app_colors.dart';
import 'main_navigation_screen.dart';

class HadeesScreen extends StatefulWidget {
  const HadeesScreen({super.key});

  @override
  State<HadeesScreen> createState() => _HadeesScreenState();
}

class _HadeesScreenState extends State<HadeesScreen> {
  // Hadees books data
  final List<Map<String, String>> _hadeesBooks = [
    {
      'arabic': 'صحیح البخاری',
      'english': 'Al-Bukhari',
    },
    {
      'arabic': 'صحیح مسلم',
      'english': 'Al-Muslim',
    },
    {
      'arabic': 'جامع ترندی',
      'english': 'Al-Tirmazi',
    },
    {
      'arabic': 'سنن ابو داؤد',
      'english': 'Abu Dawood',
    },
    {
      'arabic': 'سنن نسائی',
      'english': 'Al-Nasai',
    },
    {
      'arabic': 'سنن ابن ماجه',
      'english': 'Sunnan e Ibn e Maja',
    },
    {
      'arabic': 'السلسلة',
      'english': 'Al-Silsila',
    },
    {
      'arabic': 'مسند احمد',
      'english': 'Musnad Ahmed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      // Check if we can pop (navigated from another screen)
                      final canPop = Navigator.canPop(context);
                      if (!canPop) {
                        // If in main navigation, navigate to home
                        return GestureDetector(
                          onTap: () {
                            // Navigate to main navigation with home index
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainNavigationScreen(initialIndex: 2),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.iconColor,
                              size: 22,
                            ),
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.iconColor,
                            size: 22,
                          ),
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final languageService = Provider.of<LanguageService>(context);
                      final localizations = AppLocalizations(languageService.currentLanguage);
                      return Text(
                        localizations.hadees,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                          letterSpacing: 0.5,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 40), // Balance for back button
                ],
              ),
            ),

            // Hadees Books Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: _hadeesBooks.length,
                  itemBuilder: (context, index) {
                    return _buildHadeesCard(_hadeesBooks[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHadeesCard(Map<String, String> book) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to hadees details or chapters
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.borderColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Decorative swirl patterns - corners
              Positioned(
                top: 10,
                left: 10,
                child: _buildSwirlPattern(),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: _buildSwirlPattern(),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: _buildSwirlPattern(),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: _buildSwirlPattern(),
              ),
              // Middle left swirl
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildSwirlPattern(),
                ),
              ),
              // Middle right swirl
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildSwirlPattern(),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 1),
                    // Arabic text
                    Flexible(
                      flex: 3,
                      child: Center(
                        child: Text(
                          book['arabic']!,
                          style: const TextStyle(
                            color: AppColors.iconColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // English transliteration
                    Flexible(
                      flex: 1,
                      child: Text(
                        book['english']!,
                        style: const TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwirlPattern() {
    return CustomPaint(
      size: const Size(20, 20),
      painter: SwirlPainter(),
    );
  }
}

// Custom painter for swirl patterns
class SwirlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.iconColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;

    // Draw decorative swirl pattern using arcs
    final path = Path();
    
    // Create a spiral/swirl effect with arcs
    for (int i = 0; i < 3; i++) {
      final currentRadius = radius * (1 - i * 0.3);
      path.addArc(
        Rect.fromCircle(center: center, radius: currentRadius),
        i * 1.0,
        2.0,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
