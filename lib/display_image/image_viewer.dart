import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageView extends StatelessWidget {
  final String imageType;

  const ImageView({super.key, required this.imageType});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: _loadImageFromDocumentsDirectory(imageType),
            builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Image.file(
                  snapshot.data!,
                  fit: BoxFit.contain,
                );
              } else {
                // You can show a loading indicator or an error message here
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<File?> _loadImageFromDocumentsDirectory(String imageType) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files =
        Directory(documentsDir.path).listSync();

    List<FileSystemEntity> scoreList = files
        .where((entity) =>
            entity is File &&
            entity.uri.pathSegments.last.startsWith("${imageType}_"))
        .toList();

    /// Get the most recent element with matching imageType
    if (scoreList.isNotEmpty) {
      scoreList.sort((a, b) => b.path.compareTo(a.path));
      print("Loaded image ${scoreList.last.path}");
      return File(scoreList.first.path);
    }

    return null;
  }
}
