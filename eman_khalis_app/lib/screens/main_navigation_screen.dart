import 'package:flutter/material.dart';
import '../widgets/persistent_bottom_nav.dart';
import 'home_screen.dart';
import 'hadees_screen.dart';
import 'quran_screen.dart';
import 'qa_screen.dart';
import 'settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final int? initialIndex;
  
  const MainNavigationScreen({super.key, this.initialIndex});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

// Export state class for FeatureGrid access and global access
class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;
  
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 2; // Default to Home screen (index 2)
  }

  final List<Widget> _screens = [
    const QuranScreen(),
    const HadeesScreen(),
    const HomeScreen(),
    const QAScreen(),
    const SettingsScreen(),
  ];

  void navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int get currentIndex => _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
