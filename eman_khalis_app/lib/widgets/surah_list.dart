import 'package:flutter/material.dart';

class SurahList extends StatefulWidget {
  const SurahList({super.key});

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  final Map<int, bool> _favorites = {};
  final Map<int, bool> _downloads = {};

  // Sample surah data with Arabic names
  final List<Map<String, dynamic>> surahs = [
    {
      'number': 1,
      'arabicName': 'الفاتحة',
      'englishName': 'Surat-ul-Fateha',
      'verses': 7,
    },
    {
      'number': 2,
      'arabicName': 'البقرة',
      'englishName': 'Surat-ul-Baqara',
      'verses': 286,
    },
    {
      'number': 3,
      'arabicName': 'آل عمران',
      'englishName': 'Surat Aal-e-Imran',
      'verses': 200,
    },
    {
      'number': 4,
      'arabicName': 'النساء',
      'englishName': 'Surat-un-Nissa',
      'verses': 176,
    },
  ];

  @override
  Widget build(BuildContext context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100, top: 8),
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];
                return _buildSurahItem(context, surah);
              },
            ),
          );
  }

  Widget _buildSurahItem(BuildContext context, Map<String, dynamic> surah) {
    final number = surah['number'] as int;
    final isFavorite = _favorites[number] ?? false;
    final isDownloaded = _downloads[number] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
        children: [
          // Surah Number
          Text(
            number.toString(),
            style: const TextStyle(
              color: Color(0xFF212121),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 16),

          // Arabic Name (Large, light green)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah['arabicName'] as String,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2196F3),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  surah['englishName'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                  ),
                ),
                Text(
                  'Verses ${surah['verses']}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),

          // Favorite Icon
          IconButton(
            onPressed: () {
              setState(() {
                _favorites[number] = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : const Color(0xFF757575),
              size: 24,
            ),
          ),

          // Download Icon
          IconButton(
            onPressed: () {
              setState(() {
                _downloads[number] = !isDownloaded;
              });
            },
            icon: Icon(
              isDownloaded ? Icons.cloud_done : Icons.cloud_download_outlined,
              color: const Color(0xFF757575),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
