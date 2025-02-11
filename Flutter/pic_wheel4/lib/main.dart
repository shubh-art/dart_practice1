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

void pickImages(int index) async {
  const int maxImagesPerAlbum = 10;
  int remainingSlots = maxImagesPerAlbum - albums[index].length;

  if (remainingSlots <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You can only add up to $maxImagesPerAlbum images per album.")),
    );
    return; // Stop further execution
  }

  final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
  
  if (pickedFiles != null && pickedFiles.isNotEmpty) {
    // Trim selection to respect the remaining limit
    List<File> selectedImages = pickedFiles
        .take(remainingSlots) // Only take allowed number
        .map((file) => File(file.path))
        .toList();

    setState(() {
      albums[index].addAll(selectedImages);
    });

    if (selectedImages.length < pickedFiles.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Only $remainingSlots more images could be added.")),
      );
    }
  }
}

  void showAlbum(int index) {
  if (albums[index].isEmpty) {
    pickImages(index);
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Album ${index + 1}"),
          content: SizedBox(
            width: double.maxFinite,
            height: 300, // Adjust as needed
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
                    showImageViewer(index, imgIndex); // Open full-screen viewer
                  },
                  child: Image.file(albums[index][imgIndex], fit: BoxFit.cover),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

void showImageViewer(int albumIndex, int startIndex) {
  PageController controller = PageController(initialPage: startIndex);

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: albums[albumIndex].length,
              itemBuilder: (context, imgIndex) {
                return InteractiveViewer(
                  panEnabled: false,
                  child: Image.file(albums[albumIndex][imgIndex], fit: BoxFit.contain),
                );
              },
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    },
  );
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
