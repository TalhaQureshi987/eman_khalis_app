import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    final notes = [
      {
        'title': 'فلا کا راستہ',
        'titleEn': 'Path of Success',
        'icon': Icons.flag,
      },
      {
        'title': 'عذاب برزخ',
        'titleEn': 'Punishment of Barzakh',
        'icon': Icons.warning,
      },
      {
        'title': 'نماز',
        'titleEn': 'Prayer (Salah)',
        'icon': Icons.mosque,
      },
      {
        'title': 'حج',
        'titleEn': 'Hajj',
        'icon': Icons.location_city,
      },
      {
        'title': 'زکوة',
        'titleEn': 'Zakat',
        'icon': Icons.account_balance_wallet,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2196F3),
            size: 20,
          ),
        ),
        title: Text(
          localizations.notes,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF5F7FA),
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Navigate to note details
                    _showNoteDetails(context, note);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
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
                          color: const Color(0xFF2196F3).withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE8F5E8),
                                Color(0xFFC8E6C9),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            note['icon'] as IconData,
                            color: const Color(0xFF2196F3),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                note['title'] as String,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF212121),
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                note['titleEn'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF2196F3),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showNoteDetails(BuildContext context, Map<String, dynamic> note) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    note['title'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    note['titleEn'] as String,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Note content will be displayed here...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF757575),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

