import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_navigation_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Welcome to Eman Khalis',
      titleUrdu: 'السلام علیکم',
      description: 'Your comprehensive Islamic companion for prayer times, Quran, Hadith, and more.',
      descriptionUrdu: 'نماز کے اوقات، قرآن، حدیث اور مزید کے لیے آپ کا جامع اسلامی ساتھی۔',
      icon: Icons.mosque,
    ),
    OnboardingPage(
      title: 'Prayer Times & Qibla',
      titleUrdu: 'نماز کے اوقات اور قبلہ',
      description: 'Get accurate prayer times for your location and find the Qibla direction.',
      descriptionUrdu: 'اپنے مقام کے لیے درست نماز کے اوقات حاصل کریں اور قبلہ کی سمت تلاش کریں۔',
      icon: Icons.access_time,
    ),
    OnboardingPage(
      title: 'Quran & Hadith',
      titleUrdu: 'قرآن اور حدیث',
      description: 'Read the Holy Quran and authentic Hadith collections at your fingertips.',
      descriptionUrdu: 'اپنی انگلیوں پر قرآن پاک اور مستند احادیث کا ذخیرہ پڑھیں۔',
      icon: Icons.menu_book,
    ),
    OnboardingPage(
      title: 'Dua & Daily Guidance',
      titleUrdu: 'دعا اور روزمرہ کی رہنمائی',
      description: 'Access daily duas, Q&A, and guidance for your spiritual journey.',
      descriptionUrdu: 'اپنے روحانی سفر کے لیے روزمرہ دعائیں، سوالات و جوابات اور رہنمائی تک رسائی حاصل کریں۔',
      icon: Icons.favorite,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  Future<void> _goToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    
    if (mounted) {
      // Skip login - go directly to main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  void _onSkip() {
    _goToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: _onSkip,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF2196F3),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            // Page indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildIndicator(index == _currentPage),
                ),
              ),
            ),

            // Next/Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Name in English and Urdu
            Column(
              children: [
                const Text(
                  'Eman Khalis',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'الإيمان الخالص',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 1.5,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 40),
              ],
            ),

            // Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                page.icon,
                size: 60,
                color: const Color(0xFF2196F3),
              ),
            ),

            const SizedBox(height: 40),

            // Title in English
            Text(
              page.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),

            const SizedBox(height: 12),

            // Title in Urdu
            Text(
              page.titleUrdu,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2196F3),
                height: 1.6,
              ),
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 20),

            // Description in English
            Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF757575),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 12),

            // Description in Urdu
            Text(
              page.descriptionUrdu,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF757575),
                height: 1.6,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String titleUrdu;
  final String description;
  final String descriptionUrdu;
  final IconData icon;

  OnboardingPage({
    required this.title,
    required this.titleUrdu,
    required this.description,
    required this.descriptionUrdu,
    required this.icon,
  });
}

