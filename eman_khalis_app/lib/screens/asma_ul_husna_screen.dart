import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/persistent_bottom_nav.dart';

class AsmaUlHusnaScreen extends StatelessWidget {
  const AsmaUlHusnaScreen({super.key});

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
        title: Text(localizations.asmaUlHusna),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            'Asma Ul Husna Screen',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF212121),
            ),
          ),
        ),
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
    );
  }
}

