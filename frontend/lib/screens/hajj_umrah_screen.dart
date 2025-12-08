import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import '../widgets/persistent_bottom_nav.dart';

class HajjUmrahScreen extends StatefulWidget {
  const HajjUmrahScreen({super.key});

  @override
  State<HajjUmrahScreen> createState() => _HajjUmrahScreenState();
}

class _HajjUmrahScreenState extends State<HajjUmrahScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        title: Text(localizations.hajjUmrah),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF2196F3),
          unselectedLabelColor: const Color(0xFF757575),
          indicatorColor: const Color(0xFF2196F3),
          tabs: const [
            Tab(text: 'Hajj'),
            Tab(text: 'Umrah'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHajjContent(),
          _buildUmrahContent(),
        ],
      ),
      bottomNavigationBar: PersistentBottomNav(
        currentIndex: 2, // Home is default
        onTap: (index) => _navigateToMainScreen(context, index),
      ),
    );
  }

  Widget _buildHajjContent() {
    final hajjSteps = [
      {
        'title': 'Ihram',
        'description': 'Enter the state of Ihram at the Miqat point. Wear the Ihram garments and make the intention for Hajj.',
      },
      {
        'title': 'Tawaf',
        'description': 'Perform Tawaf around the Kaaba seven times, starting and ending at the Black Stone.',
      },
      {
        'title': 'Sa\'i',
        'description': 'Perform Sa\'i between Safa and Marwa hills, walking seven times back and forth.',
      },
      {
        'title': 'Day of Arafat',
        'description': 'Spend the day at Arafat from Dhuhr until Maghrib, making dua and seeking forgiveness.',
      },
      {
        'title': 'Muzdalifah',
        'description': 'Spend the night at Muzdalifah and collect pebbles for the next day\'s ritual.',
      },
      {
        'title': 'Rami (Stoning)',
        'description': 'Throw pebbles at the three Jamarat in Mina on the 10th, 11th, and 12th of Dhul-Hijjah.',
      },
      {
        'title': 'Sacrifice',
        'description': 'Perform the sacrifice (Qurbani) on the 10th of Dhul-Hijjah.',
      },
      {
        'title': 'Halq/Taqsir',
        'description': 'Shave or trim the hair (men shave completely, women trim a small portion).',
      },
      {
        'title': 'Farewell Tawaf',
        'description': 'Perform the final Tawaf before leaving Mecca.',
      },
    ];

    return ListView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 100,
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hajj - The Fifth Pillar of Islam',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Hajj is a mandatory religious duty for Muslims that must be carried out at least once in their lifetime by all adult Muslims who are physically and financially capable of undertaking the journey.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...hajjSteps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          return _buildStepCard(step, index + 1);
        }).toList(),
      ],
    );
  }

  Widget _buildUmrahContent() {
    final umrahSteps = [
      {
        'title': 'Ihram',
        'description': 'Enter the state of Ihram at the Miqat point. Wear the Ihram garments and make the intention for Umrah.',
      },
      {
        'title': 'Tawaf',
        'description': 'Perform Tawaf around the Kaaba seven times, starting and ending at the Black Stone.',
      },
      {
        'title': 'Sa\'i',
        'description': 'Perform Sa\'i between Safa and Marwa hills, walking seven times back and forth.',
      },
      {
        'title': 'Halq/Taqsir',
        'description': 'Shave or trim the hair (men shave completely, women trim a small portion). Umrah is then complete.',
      },
    ];

    return ListView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 100,
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Umrah - The Lesser Pilgrimage',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Umrah is a pilgrimage to Mecca that can be undertaken at any time of the year. Unlike Hajj, Umrah is not mandatory but is highly recommended.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...umrahSteps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          return _buildStepCard(step, index + 1);
        }).toList(),
      ],
    );
  }

  Widget _buildStepCard(Map<String, String> step, int stepNumber) {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                stepNumber.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  step['description']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
