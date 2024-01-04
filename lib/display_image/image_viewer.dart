import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: _loadImageFromDocumentsDirectory(),
            builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Image.file(
                  snapshot.data!,
                  fit: BoxFit.contain,
                );
              } else {
                // You can show a loading indicator or an error message here
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<File?> _loadImageFromDocumentsDirectory() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files = Directory(documentsDir.path).listSync();

    if (files.isNotEmpty) {
      print("Files is not empty!");
      // Load the first image found in the documents directory
      return File(files.first.path);
    }

    return null;
  }
}
