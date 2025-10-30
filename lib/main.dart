// Import necessary Dart and Flutter libraries
import 'dart:async';                   // For timer functionality
import 'package:flutter/material.dart'; // Flutter UI framework

// Entry point of the app
void main() {
  runApp(const DigitalFrameApp());
}

// Root widget of the app
class DigitalFrameApp extends StatelessWidget {
  const DigitalFrameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Picture Frame',
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: const PictureFrame(),        // Sets the home screen widget
    );
  }
}

// PictureFrame is a StatefulWidget because image changes over time
class PictureFrame extends StatefulWidget {
  const PictureFrame({super.key});

  @override
  State<PictureFrame> createState() => _PictureFrameState();
}

// State class to handle logic and UI updates
class _PictureFrameState extends State<PictureFrame> {
  // List of image URLs hosted on AWS S3
  final List<String> imageUrls = [
    'https://ekjot-lab3-us-east.s3.amazonaws.com/flowers.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/space.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/tiger.jpg',
    'https://ekjot-lab3-us-east.s3.amazonaws.com/snow.jpg',
  ];

  int currentIndex = 0;    // Keeps track of which image is being shown
  bool isPaused = false;   // Determines if slideshow is paused
  Timer? _timer;           // Timer that rotates images every 10 seconds

  @override
  void initState() {
    super.initState();
    _startImageRotation(); // Start slideshow when widget is initialized
  }

  // Starts the image rotation using a periodic timer
  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (!isPaused) {
        setState(() {
          // Move to next image (loop back to 0 at the end)
          currentIndex = (currentIndex + 1) % imageUrls.length;
        });
      }
    });
  }

  // Toggles between pause and resume
  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50, // Light pink background
      appBar: AppBar(
        title: const Text('Digital Picture Frame'),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
      ),
      body: Center(
        // Image display frame
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
            imageUrls[currentIndex],                    // Show current image
            key: ValueKey(imageUrls[currentIndex]),     // Helps with smooth updates
            errorBuilder: (context, error, stackTrace) {
              // Show error message if image fails to load
              return const Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              // Show loading spinner while image is loading
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
        ),
      ),
      // Pause/Resume Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePause,                           // Toggle slideshow
        backgroundColor: Colors.pink,
        child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
