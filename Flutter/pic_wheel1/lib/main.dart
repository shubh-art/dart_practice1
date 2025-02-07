import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CircularAvatars()));
}

class CircularAvatars extends StatefulWidget {
  @override
  _CircularAvatarsState createState() => _CircularAvatarsState();
}

class _CircularAvatarsState extends State<CircularAvatars> {
  final double radius = 150;
  double centerX = 200, centerY = 200;
  double baseAngle = 0;
  List<File?> images = List.filled(12, null);
  double sensitivityFactor = 0.5;
  Offset? lastPosition;

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
      baseAngle += deltaAngle * sensitivityFactor; // Update global rotation
    });

    lastPosition = details.globalPosition; // Update last position
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Draggable Circular Avatars",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Stack(
          children: List.generate(12, (index) {
            double angle = (index * 2 * pi / 12) + baseAngle;
            double x = centerX + radius * cos(angle);
            double y = centerY + radius * sin(angle);

            return Positioned(
              left: x,
              top: y,
              child: GestureDetector(
                onPanStart: (details) {
                  lastPosition = details.globalPosition;
                },
                onPanUpdate: updateRotation, // Now correctly calls updateRotation
                onPanEnd: (details) {
                  lastPosition = null;
                },
                onTap: () => pickImage(index),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: images[index] != null ? FileImage(images[index]!) : null,
                  child: images[index] == null ? Icon(Icons.add_a_photo, color: Colors.white) : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
