import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Eman e Khalis',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,))
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Videos'),
            Tab(text: 'Audios'),
            Tab(text: 'Books'),
            Tab(text: 'Hablullah'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VideosTab(), // Your YouTube videos list
          AudiosTab(), // Audio tab
          BooksTab(),  // Books tab
          HablullahTab(), // Special content
        ],
      ),
    );
  }
}

/// ------------------ Videos Tab with Pagination ------------------
class VideosTab extends StatefulWidget {
  @override
  _VideosTabState createState() => _VideosTabState();
}

class _VideosTabState extends State<VideosTab> {
  final String apiKey = 'AIzaSyCYVOwEI7KLLep1XVrJU4-k7Veih6S2q8w';
  final String channelId = 'UCuNhM6zzJUHxvcqiAPsqWHQ';
  List<Map<String, String>> videos = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  String? nextPageToken;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchVideos();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300 &&
          !isLoadingMore &&
          nextPageToken != null) {
        fetchVideos(loadMore: true);
      }
    });
  }

  Future<void> fetchVideos({bool loadMore = false}) async {
    if (loadMore) {
      setState(() => isLoadingMore = true);
    } else {
      setState(() => isLoading = true);
    }

    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=20&order=date&type=video&key=$apiKey${nextPageToken != null ? "&pageToken=$nextPageToken" : ""}');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<Map<String, String>> fetchedVideos = [];

        for (var item in data['items']) {
          fetchedVideos.add({
            'videoId': item['id']['videoId'],
            'title': item['snippet']['title'],
          });
        }

        setState(() {
          if (loadMore) {
            videos.addAll(fetchedVideos);
            isLoadingMore = false;
          } else {
            videos = fetchedVideos;
            isLoading = false;
          }
          nextPageToken = data['nextPageToken'];
        });
      } else {
        throw Exception('Failed to fetch videos');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
        isLoadingMore = false;
      });
    }
  }

  void openVideo(String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoId: videoId),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: videos.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < videos.length) {
          final video = videos[index];
          return ListTile(
            leading: Image.network(
              YoutubePlayer.getThumbnail(videoId: video['videoId']!),
              width: 120,
              fit: BoxFit.cover,
            ),
            title: Text(video['title']!),
            onTap: () => openVideo(video['videoId']!),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

/// ------------------ Placeholder Tabs ------------------
class AudiosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Audios content goes here'));
  }
}

class BooksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Books content goes here'));
  }
}

class HablullahTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Hablullah content goes here'));
  }
}

/// ------------------ Video Player Screen ------------------
class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
