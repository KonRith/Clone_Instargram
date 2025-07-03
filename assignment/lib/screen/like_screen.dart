// lib/screen/like_screen.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class LikeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const LikeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  // Avatar size for all list items
  final double _avatarSize = 48;

  // Dummy data for follow requests
  final List<Map<String, String>> _followRequests = const [
    {
      'avatarUrl': 'https://i.pravatar.cc/100?img=1',
      'name': 'Seng Rothana',
      'username': 'rothana9...',
      'mutual': 'Followed by thy_yangkim'
    },
    {
      'avatarUrl': 'https://i.pravatar.cc/100?img=2',
      'name': 'Sivey 2025',
      'username': 'sivey2025',
      'mutual': 'Followed by thy_yangkim'
    },
    {
      'avatarUrl': 'https://i.pravatar.cc/100?img=3',
      'name': 'To Ng',
      'username': '_tong___...',
      'mutual': 'Followed by keath_seng_...'
    },
  ];

  // Dummy data for suggestions
  final List<Map<String, String>> _suggestions = const [
    {
      'avatarUrl': 'https://i.pravatar.cc/100?img=4',
      'name': 'Ruby Vann',
      'username': 'chika_2i',
      'mutual': 'Followed by he900ng'
    },
    {
      'avatarUrl': 'https://i.pravatar.cc/100?img=5',
      'name': 'Dory Yukie',
      'username': 'sea_yukie',
      'mutual': 'Followed by thy_yangkim'
    },
    // Add more suggestions here
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Activity', style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(tabs: [Tab(text: 'Following'), Tab(text: 'You')]),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              onPressed: onThemeToggle,
            ),
          ],
        ),
        body: TabBarView(children: [
          _buildFollowingTab(),
          _buildYouTab(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 3,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => HomeScreen(
                    isDarkMode: isDarkMode,
                    onThemeToggle: onThemeToggle,
                  ),
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => SearchScreen(
                    isDarkMode: isDarkMode,
                    onThemeToggle: onThemeToggle,
                  ),
                ),
              );
            } else if (index == 2) {
              // Handle add action
            } else if (index == 4) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                    isDarkMode: isDarkMode,
                    onThemeToggle: onThemeToggle,
                  ),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowingTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildSectionHeader('Follow Requests'),
        ..._followRequests.map((request) => _buildFollowRequestTile(request)).toList(),
        const SizedBox(height: 16),
        _buildSectionHeader('Suggested for you'),
        ..._suggestions.map((suggestion) => _buildSuggestionTile(suggestion)).toList(),
      ],
    );
  }

  Widget _buildFollowRequestTile(Map<String, String> data) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: _avatarSize / 2,
        backgroundImage: NetworkImage(data['avatarUrl']!),
      ),
      title: Text(data['username']!, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(data['mutual']!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.grey.shade200),
            child: const Text('Delete', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionTile(Map<String, String> data) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: _avatarSize / 2,
        backgroundImage: NetworkImage(data['avatarUrl']!),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['username']!, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(data['name']!),
        ],
      ),
      subtitle: Text(data['mutual']!),
      trailing: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text('Follow', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildYouTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildSectionHeader('Follow Requests'),
        _buildFollowRequestTile(_followRequests.first),
        const SizedBox(height: 16),
        _buildSectionHeader('New'),
        _buildLikeTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=10',
          name: 'karennne',
          action: 'liked your photo',
          timeAgo: '1h',
          thumbnailUrl: 'https://picsum.photos/id/1016/80/80',
        ),
        const SizedBox(height: 16),
        _buildSectionHeader('Today'),
        _buildLikeTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=5',
          name: 'kiero_d',
          secondaryName: 'zackjohn',
          action: 'and 26 others liked your photo',
          timeAgo: '3h',
          thumbnailUrl: 'https://picsum.photos/id/1025/80/80',
        ),
        const SizedBox(height: 16),
        _buildSectionHeader('This Week'),
        _buildMentionTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=12',
          name: 'craig_love',
          action: 'mentioned you in a comment:',
          comment: '@jacob_w exactly..',
          timeAgo: '2d',
        ),
        _buildFollowTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=3',
          name: 'martini_rond',
          timeAgo: '3d',
          buttonText: 'Message',
        ),
        _buildFollowTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=7',
          name: 'maxjacobson',
          timeAgo: '3d',
          buttonText: 'Message',
        ),
        _buildFollowTile(
          avatarUrl: 'https://i.pravatar.cc/100?img=14',
          name: 'mis_potter',
          timeAgo: '3d',
          buttonText: 'Follow',
          isFollowing: false,
        ),
        const SizedBox(height: 16),

        _buildSectionHeader('This Month'),
        // Add more items…
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    print('Building section header: $title');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildLikeTile({
    required String avatarUrl,
    required String name,
    String? secondaryName,
    required String action,
    required String timeAgo,
    required String thumbnailUrl,
  }) {
    print('Building like tile for: $name${secondaryName != null ? ' and $secondaryName' : ''}');
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
        radius: _avatarSize / 2,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (secondaryName != null) ...[
              const TextSpan(text: ' , '),
              TextSpan(text: secondaryName, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
            TextSpan(text: ' $action'),
          ],
        ),
      ),
      subtitle: Text(timeAgo),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(thumbnailUrl, width: 48, height: 48, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildMentionTile({
    required String avatarUrl,
    required String name,
    required String action,
    required String comment,
    required String timeAgo,
  }) {
    print('Building mention tile for: $name');
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
        radius: _avatarSize / 2,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const TextSpan(text: ' '),
            TextSpan(text: action),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment, style: const TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 4),
          Text(timeAgo),
        ],
      ),
    );
  }

  Widget _buildFollowTile({
    required String avatarUrl,
    required String name,
    required String timeAgo,
    required String buttonText,
    bool isFollowing = true,
  }) {
    print('Building follow tile for: $name, isFollowing: $isFollowing');
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
        radius: _avatarSize / 2,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(timeAgo),
      trailing: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isFollowing ? Colors.grey.shade300 : Colors.blue,
          ),
          foregroundColor: MaterialStateProperty.all(
            isFollowing ? Colors.black : Colors.white,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          print('$buttonText button tapped for $name');
        },
        child: Text(buttonText),
      ),
    );
  }
}
