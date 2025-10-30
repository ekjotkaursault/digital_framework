import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalFrameApp());
}

class DigitalFrameApp extends StatelessWidget {
  const DigitalFrameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Picture Frame',
      debugShowCheckedModeBanner: false,
      home: const PictureFrame(),
    );
  }
}

class PictureFrame extends StatefulWidget {
  const PictureFrame({super.key});

  @override
  State<PictureFrame> createState() => _PictureFrameState();
}

class _PictureFrameState extends State<PictureFrame> {
  final List<String> imageUrls = [
    'https://ekjot-lab3-us-east.s3.amazonaws.com/flowers.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/space.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/tiger.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/snow.jpg',
  ];

  int currentIndex = 0;
  bool isPaused = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (!isPaused) {
        setState(() {
          currentIndex = (currentIndex + 1) % imageUrls.length;
        });
      }
    });
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Digital Picture Frame'),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent, width: 5),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(5, 5),
              )
            ],
          ),
          child: Image.network(
            imageUrls[currentIndex],
            key: ValueKey(imageUrls[currentIndex]),
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePause,
        backgroundColor: Colors.pink,
        child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
