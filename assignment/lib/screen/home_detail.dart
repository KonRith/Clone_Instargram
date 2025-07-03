import 'package:flutter/material.dart';

class HomeDetailPage extends StatefulWidget {
  final String profileUrl;
  final String username;
  final String location;
  final String imageUrl;
  final String caption;

  const HomeDetailPage({
    Key? key,
    required this.profileUrl,
    required this.username,
    required this.location,
    required this.imageUrl,
    required this.caption,
  }) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
   double _fontSize = 16.0;

  void _increaseFont() {
    setState(() {
      _fontSize += 2;
    });
  }

  void _decreaseFont() {
    setState(() {
      if (_fontSize > 8) _fontSize -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        actions: [
          TextButton(onPressed: _increaseFont, child: const Text('A+')),
          TextButton(onPressed: _decreaseFont, child: const Text('A-')),
        ],
      ),
      body: ListView(
        children: [
          Hero(tag: widget.imageUrl, child: Image.network(widget.imageUrl)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.profileUrl)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.location),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.caption, style: TextStyle(fontSize: _fontSize)),
          ),
        ],
      ),
    );
  }
}
