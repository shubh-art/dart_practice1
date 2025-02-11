import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CircularAlbums()));
}

class CircularAlbums extends StatefulWidget {
  const CircularAlbums({super.key});

  @override
  State<CircularAlbums> createState() => _CircularAlbumsState();
}

class _CircularAlbumsState extends State<CircularAlbums> {
  final double radius = 150;
  double centerX = 200, centerY = 300;
  double baseAngle = 0;
  double sensitivityFactor = 1.0;
  Offset? lastPosition;
  
  List<List<File>> albums = List.generate(12, (_) => []);
  List<String> defaultImages = List.generate(12, (index) => "assets/image.png");

  void pickImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        albums[index].add(File(pickedFile.path));
      });
    }
  }

  void showAlbum(int index) {
    if (albums[index].isEmpty) {
      pickImage(index);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Album ${index + 1}"),
            content: SizedBox(
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: albums[index].length,
                itemBuilder: (context, imgIndex) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Image.file(albums[index][imgIndex]),
                        ),
                      );
                    },
                    child: Image.file(albums[index][imgIndex], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text("Close"))
            ],
          );
        },
      );
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
        title: Text("Draggable Circular Albums", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: GestureDetector(
        onPanStart: (details) => lastPosition = details.globalPosition,
        onPanUpdate: updateRotation,
        onPanEnd: (_) => lastPosition = null,
        child: Center(
          child: Stack(
            children: List.generate(12, (index) {
              double angle = (index * 2 * pi / 12) + baseAngle;
              double x = centerX + radius * cos(angle);
              double y = centerY + radius * sin(angle);
              return Positioned(
                left: x - 30,
                top: y - 30,
                child: GestureDetector(
                  onTap: () => showAlbum(index),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: albums[index].isNotEmpty
                        ? FileImage(albums[index].first)
                        : AssetImage(defaultImages[index]) as ImageProvider,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
