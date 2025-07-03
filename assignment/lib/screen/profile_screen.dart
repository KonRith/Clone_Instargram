// lib/screen/profile_screen.dart

import 'package:flutter/material.dart';
import 'home.dart';
import 'search_screen.dart';
import 'like_screen.dart';
import 'post_screen.dart';

class ProfileScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  // Dummy image URLs for grid
  final List<String> _gridImages = const [
    'https://picsum.photos/id/1018/200/200',
    'https://picsum.photos/id/1025/200/200',
    'https://picsum.photos/id/1031/200/200',
    'https://picsum.photos/id/1043/200/200',
    'https://picsum.photos/id/1062/200/200',
    'https://picsum.photos/id/1074/200/200',
    'https://picsum.photos/id/1084/200/200',
    'https://picsum.photos/id/109/200/200',
    'https://picsum.photos/id/110/200/200',
  ];

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search settings',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.apps),
                    title: Text('Apps'),
                    subtitle: Text('Assistant, recent apps, default apps'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    subtitle: Text('Notification history, conversations'),
                  ),
                  ListTile(
                    leading: Icon(Icons.battery_full),
                    title: Text('Battery'),
                    subtitle: Text('Charged'),
                  ),
                  ListTile(
                    leading: Icon(Icons.storage),
                    title: Text('Storage'),
                    subtitle: Text('95% used · 394 MB free'),
                  ),
                  ListTile(
                    leading: Icon(Icons.volume_up),
                    title: Text('Sound & vibration'),
                    subtitle: Text('Volume, haptics, Do Not Disturb'),
                  ),
                  ListTile(
                    leading: Icon(Icons.display_settings),
                    title: Text('Display & touch'),
                    subtitle: Text('Dark theme, font size, touch'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wallpaper),
                    title: Text('Wallpaper & style'),
                    subtitle: Text('Colors, themed icons, app grid'),
                  ),
                  ListTile(
                    leading: Icon(Icons.accessibility),
                    title: Text('Accessibility'),
                    subtitle: Text('Display, interaction, audio'),
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Security & privacy'),
                    subtitle: Text('App security, device permissions'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.lock, size: 18),
            SizedBox(width: 4),
            Text('jacob_w'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle,
          ),
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () => Scaffold.of(context).openDrawer(),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=12'),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn(context, '17', 'Posts'),
                        _buildStatColumn(context, '100k', 'Followers'),
                        _buildStatColumn(context, '7', 'Following'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Jacob West', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text('You will never be ready just start.', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 2),
                    Text('Flutter Developer Future.', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Edit Profile', style: TextStyle(color: textColor)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).dividerColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHighlightCircle(context, Icons.add, 'New'),
                    _buildHighlightCircle(context, null, 'Friends', imageUrl: 'https://picsum.photos/id/1011/80/80'),
                    _buildHighlightCircle(context, null, 'Sport', imageUrl: 'https://picsum.photos/id/1005/80/80'),
                    _buildHighlightCircle(context, null, 'Design', imageUrl: 'https://picsum.photos/id/1027/80/80'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [Icon(Icons.grid_on), Icon(Icons.person_pin_outlined)],
              ),
              const SizedBox(height: 4),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _gridImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, i) {
                  return Image.network(_gridImages[i], fit: BoxFit.cover);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => HomeScreen(isDarkMode: isDarkMode, onThemeToggle: onThemeToggle),
              ),
            );
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => SearchScreen(isDarkMode: isDarkMode, onThemeToggle: onThemeToggle),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PostScreen(isDarkMode: isDarkMode, onThemeToggle: onThemeToggle),
              ),
            );
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => LikeScreen(isDarkMode: isDarkMode, onThemeToggle: onThemeToggle),
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
    );
  }

  Widget _buildStatColumn(BuildContext context, String count, String label) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;
    final captionColor = Theme.of(context).textTheme.bodySmall?.color;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: captionColor)),
      ],
    );
  }

  Widget _buildHighlightCircle(BuildContext context, IconData? icon, String label, {String? imageUrl}) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Theme.of(context).dividerColor,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            child: icon != null ? Icon(icon, size: 32, color: Theme.of(context).iconTheme.color) : null,
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: textColor)),
        ],
      ),
    );
  }
}
