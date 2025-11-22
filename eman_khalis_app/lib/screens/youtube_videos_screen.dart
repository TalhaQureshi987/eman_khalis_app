import 'package:flutter/material.dart';

class YouTubeVideosScreen extends StatefulWidget {
  const YouTubeVideosScreen({super.key});

  @override
  State<YouTubeVideosScreen> createState() => _YouTubeVideosScreenState();
}

class _YouTubeVideosScreenState extends State<YouTubeVideosScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _videos = [
    {
      'title': 'Surah Aal-e-Imran Verses 156-171 Recitation & Translation',
      'thumbnail': 'assets/images/video1.jpg', // Placeholder
      'duration': '12:21',
      'views': '289',
      'timeAgo': '5 days ago',
      'channel': 'Eman e Khalis',
    },
    {
      'title': 'Surah At-Tawbah Rukoo 8 | Quran Translation and Recitation',
      'thumbnail': 'assets/images/video2.jpg',
      'duration': '16:10',
      'views': '227',
      'timeAgo': '6 days ago',
      'channel': 'Eman e Khalis',
    },
    {
      'title': 'Aay Eman Walo! Eman le Aao',
      'thumbnail': 'assets/images/video3.jpg',
      'duration': '20:57',
      'views': '692',
      'timeAgo': '10 days ago',
      'channel': 'Eman e Khalis',
    },
    {
      'title': 'Surah Aal-e-Imran Verses 149-155 with Recitation & Translation',
      'thumbnail': 'assets/images/video4.jpg',
      'duration': '8:18',
      'views': '200',
      'timeAgo': '12 days ago',
      'channel': 'Eman e Khalis',
    },
    {
      'title': 'Surah At-Tawbah Rukoo 7 Part 2 | Quran Translation and Recitation',
      'thumbnail': 'assets/images/video5.jpg',
      'duration': '13:16',
      'views': '1.8K',
      'timeAgo': '13 days ago',
      'channel': 'Eman e Khalis',
    },
    {
      'title': 'Ab Bhi Waqt Hay, Allah ki Taraf Rujoo Kerlo',
      'thumbnail': 'assets/images/video6.jpg',
      'duration': '52:02',
      'views': '938',
      'timeAgo': '2 weeks ago',
      'channel': 'Eman e Khalis',
    },
  ];

  final List<String> _tabs = ['Home', 'Videos', 'Shorts', 'Playlists'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF212121),
            size: 20,
          ),
        ),
        title: const Text(
          'Eman e Khalis',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
              color: Color(0xFF212121),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xFF212121),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF212121),
              size: 22,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF2196F3),
              indicatorWeight: 3,
              labelColor: const Color(0xFF2196F3),
              unselectedLabelColor: const Color(0xFF757575),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildVideoList(),
          _buildVideoList(),
          _buildShortsList(),
          _buildPlaylistsList(),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _videos.length,
      itemBuilder: (context, index) {
        final video = _videos[index];
        return _buildVideoCard(video);
      },
    );
  }

  Widget _buildVideoCard(Map<String, dynamic> video) {
    return InkWell(
      onTap: () {
        // Handle video tap - navigate to video player
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Stack(
              children: [
                Container(
                  width: 160,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF2196F3).withOpacity(0.3),
                        const Color(0xFF2196F3).withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 48,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ),
                // Duration overlay
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      video['duration'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Video info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212121),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    video['channel'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${video['views']} views · ${video['timeAgo']}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFF757575),
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShortsList() {
    return const Center(
      child: Text(
        'Shorts Coming Soon',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF757575),
        ),
      ),
    );
  }

  Widget _buildPlaylistsList() {
    return const Center(
      child: Text(
        'Playlists Coming Soon',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF757575),
        ),
      ),
    );
  }
}

