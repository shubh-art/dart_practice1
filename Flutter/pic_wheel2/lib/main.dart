import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CircularAvatars()));
}

class CircularAvatars extends StatefulWidget {
  const CircularAvatars({super.key});
  @override
  State<CircularAvatars> createState() => _CircularAvatarsState();
}

class _CircularAvatarsState extends State<CircularAvatars> {
  final double radius = 150;
  double centerX = 200, centerY = 300;
  double baseAngle = 0;
  List<File?> images = List.filled(12, null);
  double sensitivityFactor = 1.0; // Adjusted for smoother rotation
  double lastAngle = 0.0; // Store last angle for smooth transition
  Offset? lastPosition;
  List<String> defaultImages = List.generate(12, (index) => "assets/image.png");

  void pickImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  void updateRotation(DragUpdateDetails details) {
    if (lastPosition == null) return;

    double startAngle = atan2(lastPosition!.dy - centerY, lastPosition!.dx - centerX);
    double endAngle = atan2(details.globalPosition.dy - centerY, details.globalPosition.dx - centerX);
    
    double deltaAngle = endAngle - startAngle;

    setState(() {
      baseAngle += deltaAngle * sensitivityFactor;
    });

    lastPosition = details.globalPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Circular Avatars", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: 
          GestureDetector(
            onPanStart: (details) {
              lastPosition = details.globalPosition;
            },
            onPanUpdate: updateRotation,
            onPanEnd: (_) {
              lastPosition = null;
            },
            child: Center(
              child: Stack(
                children: List.generate(12, (index) {
                  double angle = (index * 2 * pi / 12) + baseAngle;
                  double x = centerX + radius * cos(angle);
                  double y = centerY + radius * sin(angle);
          
                  return Positioned(
                    left: x - 30, // Adjust to center avatars properly
                    top: y - 30,
                    child: GestureDetector(
                      onTap: () => pickImage(index),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: images[index] != null ? FileImage(images[index]!) : AssetImage(defaultImages[index]) as ImageProvider,
                        // child: images[index] == null ? Icon(Icons.add_a_photo, color: Colors.white) : null,
                      ),
                    ),
                  );
                }
                ),
              ),
            ),
          ),
    );
  }
}
