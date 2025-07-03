// lib/screen/post_screen.dart
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const PostScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final List<String> _gallery = const [
    'https://i.pinimg.com/736x/3f/7b/a6/3f7ba6283e5563af22edf19195e5c8fc.jpg',
    'https://i.pinimg.com/736x/43/35/fa/4335faf507a85afc57a3ebb01e40317e.jpg',
    'https://i.pinimg.com/736x/4b/77/d1/4b77d1f1136a042fb58d7c66d32b9f23.jpg',
    'https://i.pinimg.com/736x/73/44/dd/7344dd4938840c62df7a447a95388794.jpg',
    'https://i.pinimg.com/736x/37/65/7c/37657cc38f9903bf72557043d3e43f58.jpg',
    'https://i.pinimg.com/736x/32/da/4d/32da4d7bc6ed63569ba7d235743691a6.jpg',
    // add more if you like…
  ];

  // which image is currently shown in the big preview?
  late String _selected;

  @override
  void initState() {
    super.initState();
    // initialize selected to first image in gallery
    _selected = _gallery.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('New post', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.onThemeToggle,
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('POST', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Column(
        children: [
          // --- big preview ---
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              _selected,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          const Divider(height: 1),

          // --- recents / icons row ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Text('Recents', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Icon(Icons.arrow_drop_down),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.collections),
                  onPressed: () {
                    // TODO: handle “select multiple”
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: () {
                    // TODO: open camera
                  },
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // --- gallery grid ---
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _gallery.length,
              itemBuilder: (context, i) {
                final img = _gallery[i];
                return GestureDetector(
                  onTap: () => setState(() => _selected = img),
                  child: Image.network(img, fit: BoxFit.cover),
                );
              },
            ),
          ),

          // --- bottom tabs ---
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('POST', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('STORY', style: TextStyle(color: Colors.grey)),
                Text('REEL', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}