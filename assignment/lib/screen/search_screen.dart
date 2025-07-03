// lib/screen/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home.dart';
import 'like_screen.dart';
import 'profile_screen.dart';

class SearchScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const SearchScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  // Sample images list
  final List<String> sampleImages = const [
    'https://picsum.photos/200?1',
    'https://picsum.photos/200?2',
    'https://picsum.photos/200?3',
    'https://picsum.photos/200?4',
    'https://picsum.photos/200?5',
    'https://picsum.photos/200?6',
    'https://picsum.photos/200?7',
    'https://picsum.photos/200?8',
    'https://picsum.photos/200?9',
    'https://i.pinimg.com/736x/19/70/b4/1970b425c9b71db713ca2fa1f47659dc.jpg',
    'https://i.pinimg.com/736x/ae/a7/40/aea74053d9113e226791d1776557077b.jpg',
    'https://i.pinimg.com/736x/55/4a/8b/554a8b5ccc449a741adacf312a6941d6.jpg',
    'https://i.pinimg.com/736x/ce/25/69/ce25699bd50067f5835e1bd685c3d246.jpg',
  ];

  // Categories list
  final List<String> categories = const ['IGTV', 'Shop', 'Style', 'Sports', 'Auto'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(),
        title: _buildSearchField(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryChips(context),
          Expanded(child: _buildImageGrid()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          } else if (index == 2) {
            // Handle add action or stay
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => LikeScreen(
                  isDarkMode: isDarkMode,
                  onThemeToggle: onThemeToggle,
                ),
              ),
            );
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
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) => Chip(
          label: Text(categories[index]),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: sampleImages.length,
        itemBuilder: (context, index) {
          final url = sampleImages[index];
          final isLandscape = index % 5 == 0;
          return SizedBox(
            height: isLandscape ? 150 : 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
