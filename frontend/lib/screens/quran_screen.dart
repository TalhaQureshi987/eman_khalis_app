import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/last_seen_audio_card.dart';
import '../widgets/quran_tabs.dart';
import '../widgets/surah_list.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  // Sample surah list for dropdown
  final List<Map<String, dynamic>> _surahs = [
    {'number': 1, 'name': 'Al-Fatihah', 'verses': 7},
    {'number': 2, 'name': 'Al-Baqarah', 'verses': 286},
    {'number': 3, 'name': 'Aal-e-Imran', 'verses': 200},
    {'number': 4, 'name': 'An-Nisa', 'verses': 176},
    {'number': 5, 'name': 'Al-Ma\'idah', 'verses': 120},
    {'number': 6, 'name': 'Al-An\'am', 'verses': 165},
    {'number': 7, 'name': 'Al-A\'raf', 'verses': 206},
    {'number': 8, 'name': 'Al-Anfal', 'verses': 75},
    {'number': 9, 'name': 'At-Tawbah', 'verses': 129},
    {'number': 10, 'name': 'Yunus', 'verses': 109},
  ];

  int? _selectedSurahNumber;
  String? _selectedSurahName;
  int? _selectedSurahVerses;
  final TextEditingController _verseController = TextEditingController();

  @override
  void dispose() {
    _verseController.dispose();
    super.dispose();
  }

  void _showJumpToSurahDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      children: [
                        const Icon(
                          Icons.swap_vert,
                          color: Color(0xFF2196F3),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Builder(
                          builder: (context) {
                            final languageService = Provider.of<LanguageService>(context);
                            final localizations = AppLocalizations(languageService.currentLanguage);
                            return Text(
                              localizations.jumpToSurah,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF212121),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Surah Dropdown
                    Builder(
                      builder: (context) {
                        final languageService = Provider.of<LanguageService>(context);
                        final localizations = AppLocalizations(languageService.currentLanguage);
                        return Text(
                          localizations.selectSurah,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          isExpanded: true,
                          value: _selectedSurahNumber,
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Select Surah',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFF2196F3),
                            ),
                          ),
                          items: _surahs.map((surah) {
                            return DropdownMenuItem<int>(
                              value: surah['number'] as int,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  '${surah['number']}. ${surah['name']}',
                                  style: const TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? value) {
                            setDialogState(() {
                              _selectedSurahNumber = value;
                              final surah = _surahs.firstWhere(
                                (s) => s['number'] == value,
                              );
                              _selectedSurahName = surah['name'] as String;
                              _selectedSurahVerses = surah['verses'] as int;
                              _verseController.clear();
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Verse Input
                    if (_selectedSurahNumber != null) ...[
                      Text(
                        'Enter the number of verse between 1-${_selectedSurahVerses}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _verseController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          hintText: '1-${_selectedSurahVerses}',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF2196F3),
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 16,
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _selectedSurahNumber = null;
                              _selectedSurahName = null;
                              _selectedSurahVerses = null;
                              _verseController.clear();
                            });
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Color(0xFF2196F3),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _selectedSurahNumber != null
                              ? () {
                                  final verseNumber = _verseController.text;
                                  if (verseNumber.isNotEmpty) {
                                    final verse = int.tryParse(verseNumber);
                                    if (verse != null &&
                                        verse >= 1 &&
                                        verse <= _selectedSurahVerses!) {
                                      // Navigate to surah and verse
                                      // You can implement navigation logic here
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Jumping to ${_selectedSurahName}, Verse $verse',
                                          ),
                                          backgroundColor: const Color(0xFF2196F3),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please enter a valid verse number',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } else {
                                    // Just navigate to surah
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Jumping to ${_selectedSurahName}',
                                        ),
                                        backgroundColor: const Color(0xFF2196F3),
                                      ),
                                    );
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2196F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF2196F3),
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Quran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                      IconButton(
                        onPressed: _showJumpToSurahDialog,
                        icon: const Icon(
                          Icons.swap_vert,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Last Seen and Last Audio Cards
            const LastSeenAudioCard(),

            // Navigation Tabs
            const QuranTabs(),

            // Surah List
            const Expanded(child: SurahList()),
          ],
        ),
      ),
    );
  }
}
