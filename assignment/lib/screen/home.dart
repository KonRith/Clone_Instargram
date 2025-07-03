import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'search_screen.dart';
import 'like_screen.dart';
import 'profile_screen.dart';
import 'home_detail.dart';
import 'post_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final Set<String> _globalLikedPostIds = {};
  final Set<String> _likedPostIds = _globalLikedPostIds;

  final List<Map<String, String>> stories = const [
    {
      'imageUrl': 'https://i.pinimg.com/736x/af/d5/70/afd5709d490f6f08efa2f2e1c581f6d3.jpg',
      'username': 'alice'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/eb/26/0b/eb260b46f5a796b18ba7795ae69b2474.jpg',
      'username': 'bob'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/56/c9/42/56c94236a9837ff1e9a139ebc9e148b1.jpg',
      'username': 'carol'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/c3/99/63/c399634dc328c96a0f2c101a234fcc35.jpg',
      'username': 'dave'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/c3/82/5b/c3825b64e05c15fc8e394a36b28ee5b0.jpg',
      'username': 'ma'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/93/ee/89/93ee8999d86b0f0dd6d95a12c5f36f4a.jpg',
      'username': 'ten'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/84/64/e8/8464e800d7d6059511dc90b78d82b94a.jpg',
      'username': 'thormg'
    },
    {
      'imageUrl': 'https://i.pinimg.com/736x/dd/b7/b5/ddb7b5437db1cff0d0ef0acb390b04ca.jpg',
      'username': 'rithy'
    },
  ];

  final List<Map<String, String>> posts = const [
    {
      'id': '0',
      'profileUrl': 'https://i.pinimg.com/736x/af/d5/70/afd5709d490f6f08efa2f2e1c581f6d3.jpg',
      'username': 'alice',
      'location': 'New York, USA',
      'postImageUrl': 'https://i.pinimg.com/736x/3f/7b/a6/3f7ba6283e5563af22edf19195e5c8fc.jpg',
      'caption': 'Study Is Very Happy!'
    },
    {
      'id': '1',
      'profileUrl': 'https://i.pinimg.com/736x/eb/26/0b/eb260b46f5a796b18ba7795ae69b2474.jpg',
      'username': 'bob',
      'location': 'Santos, Brazil',
      'localFilePath': 'assets/videos/my_video.mp4',
      'caption': 'Neyma in Prime🤯.'
    },
        {
      'id': '2',
      'profileUrl': 'https://i.pinimg.com/736x/56/c9/42/56c94236a9837ff1e9a139ebc9e148b1.jpg',
      'username': 'carol',
      'location': 'Tokyo, Japan',
      'postImageUrl': 'https://i.pinimg.com/736x/51/55/db/5155db602a1c0412ea9d86ebb6c7c02d.jpg',
      'caption': '2nd champion UEFA Nation Leauge For my Idol CR7!'
    },
    {
      'id': '3',
      'profileUrl': 'https://i.pinimg.com/736x/c3/99/63/c399634dc328c96a0f2c101a234fcc35.jpg',
      'username': 'dave',
      'location': 'Kep , Cambodia',
      'postImageUrl': 'https://i.pinimg.com/736x/43/35/fa/4335faf507a85afc57a3ebb01e40317e.jpg',
      'caption': 'With Bestie in Kampot!'
    },
    {
      'id': '4',
      'profileUrl': 'https://i.pinimg.com/736x/c3/82/5b/c3825b64e05c15fc8e394a36b28ee5b0.jpg',
      'username': 'ma',
      'location': 'Sya, Pursat',
      'postImageUrl': 'https://i.pinimg.com/736x/4b/77/d1/4b77d1f1136a042fb58d7c66d32b9f23.jpg',
      'caption': 'Sunflower Garden with the best view!'
    },
    {
      'id': '5',
      'profileUrl': 'https://i.pinimg.com/736x/93/ee/89/93ee8999d86b0f0dd6d95a12c5f36f4a.jpg',
      'username': 'ten',
      'location': 'Los Angeles, England',
      'postImageUrl': 'https://i.pinimg.com/736x/73/44/dd/7344dd4938840c62df7a447a95388794.jpg',
      'caption': 'Look at this cool sunset view behind my home!'
    },
    {
      'id': '6',
      'profileUrl': 'https://i.pinimg.com/736x/84/64/e8/8464e800d7d6059511dc90b78d82b94a.jpg',
      'username': 'thormg',
      'location': 'sad, Heart',
      'postImageUrl': 'https://i.pinimg.com/736x/37/65/7c/37657cc38f9903bf72557043d3e43f58.jpg',
      'caption': 'Waiting for someone until she married!'
    },
    {
      'id': '7',
      'profileUrl': 'https://i.pinimg.com/736x/dd/b7/b5/ddb7b5437db1cff0d0ef0acb390b04ca.jpg',
      'username': 'rithy',
      'location': 'Naruto, Anime',
      'postImageUrl': 'https://i.pinimg.com/736x/32/da/4d/32da4d7bc6ed63569ba7d235743691a6.jpg',
      'caption': 'Naruto x Hinata!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        title: Image.asset('images/logo.jpg', height: 30, fit: BoxFit.contain),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.onThemeToggle,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _AddStoryBubble(
                    imageUrl: stories[index]['imageUrl']!,
                    username: stories[index]['username']!,
                  );
                }
                return _StoryBubble(
                  imageUrl: stories[index]['imageUrl']!,
                  username: stories[index]['username']!,
                );
              },
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final id = post['id']!;
                return _PostItem(
                  profileUrl: post['profileUrl']!,
                  username: post['username']!,
                  location: post['location'] ?? '',
                  postImageUrl: post['postImageUrl'] ?? '',
                  localFilePath: post['localFilePath'],
                  caption: post['caption']!,
                  isLiked: _likedPostIds.contains(id),
                  onLikeToggled: (newState) {
                    setState(() {
                      if (newState) _likedPostIds.add(id);
                      else _likedPostIds.remove(id);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          Widget target;
          switch (index) {
            case 1:
              target = SearchScreen(isDarkMode: widget.isDarkMode, onThemeToggle: widget.onThemeToggle);
              break;
            case 2:
              target = PostScreen(isDarkMode: widget.isDarkMode, onThemeToggle: widget.onThemeToggle);
              break;
            case 3:
              target = LikeScreen(isDarkMode: widget.isDarkMode, onThemeToggle: widget.onThemeToggle);
              break;
            case 4:
              target = ProfileScreen(isDarkMode: widget.isDarkMode, onThemeToggle: widget.onThemeToggle);
              break;
            default:
              return;
          }
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => target));
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

// Story bubbles
class _AddStoryBubble extends StatelessWidget {
  final String imageUrl;
  final String username;
  const _AddStoryBubble({required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(username, style: const TextStyle(fontSize: 12)),
          ],
        ),
  );
}

class _StoryBubble extends StatelessWidget {
  final String imageUrl;
  final String username;
  const _StoryBubble({required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.redAccent, width: 2),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(username, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
}

// Post item without local mutable state
class _PostItem extends StatelessWidget {
  final String profileUrl;
  final String username;
  final String location;
  final String postImageUrl;
  final String? localFilePath;
  final String caption;
  final bool isLiked;
  final ValueChanged<bool> onLikeToggled;

  const _PostItem({
    Key? key,
    required this.profileUrl,
    required this.username,
    required this.location,
    required this.postImageUrl,
    this.localFilePath,
    required this.caption,
    required this.isLiked,
    required this.onLikeToggled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget media;
    if (localFilePath != null && localFilePath!.isNotEmpty) {
      media = _AssetVideoPlayer(path: localFilePath!);
    } else {
      media = GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeDetailPage(
              profileUrl: profileUrl,
              username: username,
              location: location,
              imageUrl: postImageUrl,
              caption: caption,
            ),
          ),
        ),
        child: Hero(tag: postImageUrl, child: Image.network(postImageUrl, fit: BoxFit.fitWidth)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(profileUrl)),
          title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(location),
          trailing: const Icon(Icons.more_vert),
        ),
        media,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.red : null),
                onPressed: () => onLikeToggled(!isLiked),
              ),
              const Icon(Icons.chat_bubble_outline),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined),
              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Liked by someone and others', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(caption),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}

// Helper widget to play asset video
class _AssetVideoPlayer extends StatefulWidget {
  final String path;
  const _AssetVideoPlayer({Key? key, required this.path}) : super(key: key);

  @override
  State<_AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<_AssetVideoPlayer> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.path)
      ..initialize().then((_) => setState(() {}))
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) return const Center(child: CircularProgressIndicator());
    return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller));
  }
}