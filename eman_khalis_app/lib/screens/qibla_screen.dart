import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/persistent_bottom_nav.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  void _navigateToMainScreen(BuildContext context, int index) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.qiblaCompass),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2196F3),
                    width: 3,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.explore,
                    size: 150,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Qibla Direction',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Point your device towards Mecca',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

