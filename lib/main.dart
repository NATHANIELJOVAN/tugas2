import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Grid View Spotify Style"),
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: [
            // GridView
            GridView.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              primary: false,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                _albumBox('assets/images/scorpion.jpeg'),
                _albumBox('assets/images/more life.jpeg'),
                _albumBox('assets/images/views.jpeg'),
                _albumBox('assets/images/ss4u.jpeg'),
                _albumBox('assets/images/clb.jpeg'),
                _albumBox('assets/images/honestly.jpeg'),
                _albumBox('assets/images/fatd.jpeg'),
                _albumBox('assets/images/take care.jpeg'),
              ],
            ),
            // Bottom Player
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.shuffle, color: Colors.white, size: 26),
                    const Icon(Icons.skip_previous, color: Colors.white, size: 30),
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.white,
                        size: 38,
                      ),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                    ),
                    const Icon(Icons.skip_next, color: Colors.white, size: 30),
                    const Icon(Icons.repeat, color: Colors.white, size: 26),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _albumBox(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white70, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
