import 'package:flutter/material.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: CircularDraggableAvatars()));
}

class CircularDraggableAvatars extends StatefulWidget {
  @override
  _CircularDraggableAvatarsState createState() =>
      _CircularDraggableAvatarsState();
}

class _CircularDraggableAvatarsState extends State<CircularDraggableAvatars> {
  double centerX = 150;
  double centerY = 300;
  double radius = 100;
  List<File?> images = List.generate(5, (index) => null);
  double angleOffset = 0;

  Future<void> pickImage(int index) async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  void updatePosition(Offset delta) {
    setState(() {
      double dx = delta.dx;
      double dy = delta.dy;
      double newAngle = atan2(dy - centerY, dx - centerX);
      angleOffset = newAngle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Draggable Circular Avatars")),
      body: Center(
        child: Stack(
          children: List.generate(5, (index) {
            double angle = (index * 2 * pi / 5) + angleOffset;
            double x = centerX + radius * cos(angle);
            double y = centerY + radius * sin(angle);

            return Positioned(
              left: x,
              top: y,
              child: GestureDetector(
                onPanUpdate: (details) {
                  updatePosition(details.globalPosition);
                },
                onTap: () => pickImage(index),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  images[index] != null ? FileImage(images[index]!) : null,
                  child: images[index] == null
                      ? Icon(Icons.add_a_photo, color: Colors.white)
                      : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
