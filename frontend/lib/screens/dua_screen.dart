import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/persistent_bottom_nav.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  final List<Map<String, String>> duas = [
    {
      'title': 'Dua for Morning',
      'arabic': 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ',
      'translation': 'O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die.',
      'category': 'Daily',
    },
    {
      'title': 'Dua for Evening',
      'arabic': 'اللَّهُمَّ بِكَ أَمْسَيْنَا وَبِكَ أَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ',
      'translation': 'O Allah, by You we enter the evening and by You we enter the morning, by You we live and by You we die.',
      'category': 'Daily',
    },
    {
      'title': 'Dua Before Eating',
      'arabic': 'بِسْمِ اللَّهِ',
      'translation': 'In the name of Allah.',
      'category': 'Food',
    },
    {
      'title': 'Dua After Eating',
      'arabic': 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ',
      'translation': 'All praise is due to Allah who fed us and gave us drink and made us Muslims.',
      'category': 'Food',
    },
    {
      'title': 'Dua for Entering Home',
      'arabic': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ وَخَيْرَ الْمَخْرَجِ',
      'translation': 'O Allah, I ask You for the best entrance and the best exit.',
      'category': 'Home',
    },
    {
      'title': 'Dua for Leaving Home',
      'arabic': 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      'translation': 'In the name of Allah, I place my trust in Allah, and there is no might nor power except with Allah.',
      'category': 'Home',
    },
    {
      'title': 'Dua Before Sleeping',
      'arabic': 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      'translation': 'In Your name, O Allah, I die and I live.',
      'category': 'Sleep',
    },
    {
      'title': 'Dua After Waking Up',
      'arabic': 'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      'translation': 'All praise is due to Allah who gave us life after taking it from us and to Him is the resurrection.',
      'category': 'Sleep',
    },
  ];

  String _selectedCategory = 'All';

  List<String> get categories => ['All', ...duas.map((e) => e['category']!).toSet().toList()];

  List<Map<String, String>> get filteredDuas {
    if (_selectedCategory == 'All') return duas;
    return duas.where((dua) => dua['category'] == _selectedCategory).toList();
  }

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
        title: Text(localizations.dua),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = _selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF2196F3) : Colors.white,
                      border: Border.all(
                        color: isSelected ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF212121),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Duas List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 100,
              ),
              itemCount: filteredDuas.length,
              itemBuilder: (context, index) {
                final dua = filteredDuas[index];
                return _buildDuaCard(dua);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
    );
  }

  Widget _buildDuaCard(Map<String, String> dua) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  dua['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  dua['category']!,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF2196F3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            dua['arabic']!,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF2196F3),
              height: 1.8,
              fontWeight: FontWeight.w500,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          Text(
            dua['translation']!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF757575),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
