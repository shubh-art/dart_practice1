import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SemiCircularImages(),
    );
  }
}

class SemiCircularImages extends StatefulWidget {
  @override
  _SemiCircularImagesState createState() => _SemiCircularImagesState();
}

class _SemiCircularImagesState extends State<SemiCircularImages> {
  double radius = 150.0; // Radius of the semicircle
  int totalImages = 16;  // Total number of images
  Offset center = Offset(200, 350); // Center of the semicircle

  double groupAngle = 0.0; // Angle for the whole group
  String selectedImage = 'assets/images/1.jpg'; // Placeholder image for tap
  double expandedSize = 50.0; // Default image size

  void _updateGroupAngle(DragUpdateDetails details) {
    setState(() {
      groupAngle += details.primaryDelta! * 0.0025;
      if (groupAngle >= 2 * pi) groupAngle -= 2 * pi;
      if (groupAngle <= -2 * pi) groupAngle += 2 * pi;
    });
  }

  void _onImageTap(int index) {
    setState(() {
      // Change image based on index or apply custom image change logic
      selectedImage = 'assets/images/2.jpg'; // Example of change
      expandedSize = 100.0; // Expand tapped image size
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interactive Semicircular Images")),
      body: Center(
        child: GestureDetector(
          onPanUpdate: _updateGroupAngle, // Drag to move images
          child: Container(
            width: radius * 2,
            height: radius + 50, // Make a little bigger to handle gestures
            color: Colors.transparent, // Transparent gesture area
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Optional: Semicircle path for reference
                Positioned(
                  child: Container(
                    width: radius * 2,
                    height: radius,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),

                // Display images in a semicircle
                ...List.generate(totalImages, (index) {
                  final double angle = groupAngle + (pi / (totalImages - 1)) * index;
                  final double x = center.dx + radius * cos(angle - pi / 2);
                  final double y = center.dy + radius * sin(angle - pi / 2);

                  // Check if it's the selected (expanded) image
                  bool isExpanded = expandedSize > 50.0 && index == totalImages ~/ 2; // Example logic for expanding

                  return Positioned(
                    left: x - center.dx - expandedSize / 2, // Center the image
                    top: y - center.dy - expandedSize / 2,
                    child: GestureDetector(
                      onTap: () => _onImageTap(index), // Tap to change or expand image
                      child: ClipOval(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: isExpanded ? 150.0 : expandedSize, // Expand the tapped image
                          height: isExpanded ? 150.0 : expandedSize,
                          child: Image.asset(
                            selectedImage, // Image changes on tap
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
