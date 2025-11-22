import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../models/hadees_model.dart';

class HadeesScreen extends StatefulWidget {
  const HadeesScreen({super.key});

  @override
  State<HadeesScreen> createState() => _HadeesScreenState();
}

class _HadeesScreenState extends State<HadeesScreen> {
  int _selectedTab = 0; // 0: Collections, 1: Favorite, 2: Categories
  final Map<int, bool> _favorites = {};
  String _selectedCollection = 'Sahih Bukhari';
  String? _selectedBab; // Selected Bab (Chapter)
  int? _selectedJild; // Selected Jild (Volume)
  String _currentView = 'bab'; // 'bab', 'jild', or 'hadees'

  // Sample Hadees data
  final List<HadeesModel> _hadeesList = [
    HadeesModel(
      number: 1,
      arabicText: 'إنما الأعمال بالنيات',
      englishText: 'Actions are but by intention and every man shall have only what he intended.',
      narrator: 'Umar ibn al-Khattab',
      collection: 'Sahih Bukhari',
      chapter: 'Book of Revelation',
      bab: 'Book of Revelation',
      jild: 1,
    ),
    HadeesModel(
      number: 2,
      arabicText: 'الدين النصيحة',
      englishText: 'The religion is sincerity and advice.',
      narrator: 'Tamim al-Dari',
      collection: 'Sahih Muslim',
      chapter: 'Book of Faith',
      bab: 'Book of Faith',
      jild: 1,
    ),
    HadeesModel(
      number: 3,
      arabicText: 'لا ضرر ولا ضرار',
      englishText: 'There should be no harming, nor reciprocating harm.',
      narrator: 'Ibn Abbas',
      collection: 'Sunan Ibn Majah',
      chapter: 'Book of Rulings',
      bab: 'Book of Rulings',
      jild: 2,
    ),
    HadeesModel(
      number: 4,
      arabicText: 'من أحدث في أمرنا هذا ما ليس منه فهو رد',
      englishText: 'Whoever innovates something in this matter of ours that is not part of it, will have it rejected.',
      narrator: 'Aisha',
      collection: 'Sahih Bukhari',
      chapter: 'Book of Reconciliation',
      bab: 'Book of Reconciliation',
      jild: 1,
    ),
    HadeesModel(
      number: 5,
      arabicText: 'المؤمن للمؤمن كالبنيان يشد بعضه بعضا',
      englishText: 'A believer to another believer is like a building whose different parts enforce each other.',
      narrator: 'Abu Musa al-Ash\'ari',
      collection: 'Sahih Bukhari',
      chapter: 'Book of Manners',
      bab: 'Book of Manners',
      jild: 2,
    ),
    HadeesModel(
      number: 6,
      arabicText: 'من كان يؤمن بالله واليوم الآخر فليقل خيرا أو ليصمت',
      englishText: 'Whoever believes in Allah and the Last Day should speak good or remain silent.',
      narrator: 'Abu Huraira',
      collection: 'Sahih Bukhari',
      chapter: 'Book of Manners',
      bab: 'Book of Manners',
      jild: 2,
    ),
  ];

  // Get unique Babs for selected collection
  List<String> get _babs {
    return _hadeesList
        .where((h) => h.collection == _selectedCollection)
        .map((h) => h.bab)
        .toSet()
        .toList()
      ..sort();
  }

  // Get unique Jilds for selected Bab
  List<int> get _jilds {
    if (_selectedBab == null) return [];
    return _hadeesList
        .where((h) => h.collection == _selectedCollection && h.bab == _selectedBab)
        .map((h) => h.jild)
        .toSet()
        .toList()
      ..sort();
  }

  List<HadeesModel> get _filteredHadees {
    if (_selectedTab == 1) {
      // Favorite tab
      return _hadeesList.where((h) => _favorites[h.number] == true).toList();
    }
    
    if (_currentView == 'hadees' && _selectedBab != null && _selectedJild != null) {
      // Show hadees for selected Bab and Jild
      return _hadeesList
          .where((h) => 
            h.collection == _selectedCollection && 
            h.bab == _selectedBab && 
            h.jild == _selectedJild)
          .toList();
    }
    
    // Default: return all hadees for collection (for backward compatibility)
    return _hadeesList.where((h) => h.collection == _selectedCollection).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with white background and green accents
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_currentView == 'hadees') {
                        // Go back to Jild list
                        setState(() {
                          _currentView = 'jild';
                          _selectedJild = null;
                        });
                      } else if (_currentView == 'jild') {
                        // Go back to Bab list
                        setState(() {
                          _currentView = 'bab';
                          _selectedBab = null;
                          _selectedJild = null;
                        });
                      } else {
                        // Default back behavior
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF2196F3),
                      size: 20,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final languageService = Provider.of<LanguageService>(context);
                      final localizations = AppLocalizations(languageService.currentLanguage);
                      String title;
                      if (_currentView == 'hadees') {
                        title = '${_selectedBab ?? localizations.hadees} - Jild $_selectedJild';
                      } else if (_currentView == 'jild') {
                        title = _selectedBab ?? localizations.hadees;
                      } else {
                        title = localizations.hadees;
                      }
                      return Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ],
              ),
            ),

            // Collection selector tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCollectionTab('Sahih Bukhari', 0),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildCollectionTab('Sahih Muslim', 1),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildCollectionTab('Others', 2),
                  ),
                ],
              ),
            ),

            // Navigation Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      final languageService = Provider.of<LanguageService>(context);
                      final localizations = AppLocalizations(languageService.currentLanguage);
                      return Row(
                        children: [
                          Expanded(
                            child: _buildNavTab(localizations.collections, 0),
                          ),
                          Expanded(
                            child: _buildNavTab(localizations.favorite, 1),
                          ),
                          Expanded(
                            child: _buildNavTab(localizations.categories, 2),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Content based on current view
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionTab(String label, int index) {
    final isSelected = _selectedCollection == label || 
                       (index == 2 && !['Sahih Bukhari', 'Sahih Muslim'].contains(_selectedCollection));
    
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == 0) {
            _selectedCollection = 'Sahih Bukhari';
          } else if (index == 1) {
            _selectedCollection = 'Sahih Muslim';
          } else {
            _selectedCollection = 'Others';
          }
          // Reset navigation when collection changes
          _selectedBab = null;
          _selectedJild = null;
          _currentView = 'bab';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2196F3) : Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF212121),
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      ),
    );
  }

  Widget _buildNavTab(String label, int index) {
    final isSelected = _selectedTab == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF2196F3) : const Color(0xFF757575),
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHadeesCard(HadeesModel hadees) {
    final isFavorite = _favorites[hadees.number] ?? false;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              Text(
                'Hadees ${hadees.number}',
                style: const TextStyle(
                  color: Color(0xFF2196F3),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _favorites[hadees.number] = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : const Color(0xFF757575),
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Color(0xFF757575),
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Arabic text
          Text(
            hadees.arabicText,
            style: const TextStyle(
              color: Color(0xFF2196F3),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.6,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 12),
          // English text
          Text(
            hadees.englishText,
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          // Narrator and collection
          Row(
            children: [
              Icon(
                Icons.person_outline,
                color: const Color(0xFF757575),
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                hadees.narrator,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.book_outlined,
                color: const Color(0xFF757575),
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                hadees.collection,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedTab == 1) {
      // Favorite tab - show hadees directly
      return ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _filteredHadees.length,
        itemBuilder: (context, index) {
          final hadees = _filteredHadees[index];
          return _buildHadeesCard(hadees);
        },
      );
    }

    if (_currentView == 'bab') {
      // Show Bab list
      return ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _babs.length,
        itemBuilder: (context, index) {
          final bab = _babs[index];
          return _buildBabCard(bab);
        },
      );
    } else if (_currentView == 'jild') {
      // Show Jild list
      return ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _jilds.length,
        itemBuilder: (context, index) {
          final jild = _jilds[index];
          return _buildJildCard(jild);
        },
      );
    } else {
      // Show Hadees list
      return ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 100,
        ),
        itemCount: _filteredHadees.length,
        itemBuilder: (context, index) {
          final hadees = _filteredHadees[index];
          return _buildHadeesCard(hadees);
        },
      );
    }
  }

  Widget _buildBabCard(String bab) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.book_outlined,
            color: Color(0xFF2196F3),
            size: 20,
          ),
        ),
        title: Text(
          bab,
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF2196F3),
          size: 16,
        ),
        onTap: () {
          setState(() {
            _selectedBab = bab;
            _selectedJild = null;
            _currentView = 'jild';
          });
        },
      ),
    );
  }

  Widget _buildJildCard(int jild) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$jild',
              style: const TextStyle(
                color: Color(0xFF2196F3),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          'Jild $jild',
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          _selectedBab ?? '',
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF2196F3),
          size: 16,
        ),
        onTap: () {
          setState(() {
            _selectedJild = jild;
            _currentView = 'hadees';
          });
        },
      ),
    );
  }
}
