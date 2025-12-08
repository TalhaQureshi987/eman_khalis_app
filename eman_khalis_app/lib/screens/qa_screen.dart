import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({super.key});

  @override
  State<QAScreen> createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen> {
  final Map<String, List<Map<String, String>>> questionsByTopic = {
    'Prayer (Salah)': [
      {
        'question': 'How many prayers are obligatory in a day?',
        'answer': 'There are five obligatory prayers in a day: Fajr, Dhuhr, Asr, Maghrib, and Isha.',
      },
      {
        'question': 'What is the time for Fajr prayer?',
        'answer': 'Fajr prayer time begins at dawn (when the first light appears) and ends just before sunrise.',
      },
      {
        'question': 'Can I combine prayers?',
        'answer': 'Yes, you can combine Dhuhr with Asr, and Maghrib with Isha, but only when you have a valid reason such as traveling, illness, or heavy rain.',
      },
    ],
    'Fasting (Ramadan)': [
      {
        'question': 'Who is required to fast in Ramadan?',
        'answer': 'Fasting in Ramadan is obligatory for all adult Muslims who are physically and mentally capable, except for those who are traveling, ill, pregnant, breastfeeding, or menstruating.',
      },
      {
        'question': 'What breaks the fast?',
        'answer': 'Eating, drinking, sexual activity, smoking, and intentional vomiting break the fast. Unintentional eating or drinking does not break the fast.',
      },
      {
        'question': 'What is Iftar?',
        'answer': 'Iftar is the evening meal with which Muslims break their fast at sunset during Ramadan.',
      },
    ],
    'Zakat (Charity)': [
      {
        'question': 'What is Zakat?',
        'answer': 'Zakat is an obligatory form of charity, a fixed percentage of wealth that Muslims are required to give annually to help those in need.',
      },
      {
        'question': 'How much is Zakat?',
        'answer': 'Zakat is typically 2.5% of one\'s total wealth that has been held for one full lunar year, above the nisab (minimum threshold).',
      },
      {
        'question': 'Who is eligible to receive Zakat?',
        'answer': 'Zakat can be given to the poor, needy, those in debt, travelers in need, and those working to collect and distribute Zakat.',
      },
    ],
    'Hajj & Umrah': [
      {
        'question': 'What is the difference between Hajj and Umrah?',
        'answer': 'Hajj is the major pilgrimage that is obligatory once in a lifetime for those who are able, performed during specific days. Umrah is the lesser pilgrimage that can be performed at any time of the year and is not obligatory.',
      },
      {
        'question': 'What are the pillars of Hajj?',
        'answer': 'The pillars of Hajj are: Ihram, Tawaf, Sa\'i, standing at Arafat, and shaving or trimming hair.',
      },
    ],
    'Quran': [
      {
        'question': 'How many chapters (Surahs) are in the Quran?',
        'answer': 'The Quran contains 114 chapters (Surahs), starting with Al-Fatiha and ending with An-Nas.',
      },
      {
        'question': 'What is the first Surah of the Quran?',
        'answer': 'The first Surah of the Quran is Al-Fatiha (The Opening), which is also recited in every unit of prayer.',
      },
    ],
    'General': [
      {
        'question': 'What are the Five Pillars of Islam?',
        'answer': 'The Five Pillars of Islam are: 1) Shahada (Declaration of Faith), 2) Salah (Prayer), 3) Zakat (Charity), 4) Sawm (Fasting in Ramadan), and 5) Hajj (Pilgrimage to Mecca).',
      },
      {
        'question': 'What is the Qibla?',
        'answer': 'The Qibla is the direction that Muslims face when performing prayers, which is towards the Kaaba in Mecca, Saudi Arabia.',
      },
    ],
  };

  String? _selectedTopic;
  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
    // Auto-select first topic when screen loads
    if (questionsByTopic.isNotEmpty) {
      _selectedTopic = questionsByTopic.keys.first;
    }
  }

  List<String> get topics => questionsByTopic.keys.toList();

  @override
  Widget build(BuildContext context) {
    final selectedQuestions = _selectedTopic != null
        ? questionsByTopic[_selectedTopic!]!
        : <Map<String, String>>[];

    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.qa),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
      ),
      body: Column(
        children: [
          // Topic Selection
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                final isSelected = _selectedTopic == topic;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTopic = topic;
                      _expandedIndex = null;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF2196F3) : Colors.white,
                      border: Border.all(
                        color: isSelected ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        topic,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF212121),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Questions List
          Expanded(
            child: _selectedTopic == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Select a topic to view questions',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                        : ListView.builder(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 100,
                            ),
                            itemCount: selectedQuestions.length,
                            itemBuilder: (context, index) {
                              final qa = selectedQuestions[index];
                              final isExpanded = _expandedIndex == index;
                              return _buildQACard(qa, index, isExpanded);
                            },
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildQACard(Map<String, String> qa, int index, bool isExpanded) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedIndex = isExpanded ? null : index;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      qa['question']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF212121),
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: const Color(0xFF2196F3),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  qa['answer']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF212121),
                    height: 1.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
