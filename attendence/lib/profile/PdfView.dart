import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:attendence/profile/ViewProfile.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../Colours.dart';
import '../dashboard/Dashboard.dart';

class PdfView extends StatefulWidget {
  final String base64String;

  const PdfView({Key? key, required this.base64String}) : super(key: key);

  @override
  _Base64ToPdfViewerState createState() => _Base64ToPdfViewerState();
}

class _Base64ToPdfViewerState extends State<PdfView> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> _downloadImage() async {
    // Decode Base64 string to bytes
    Uint8List bytes = base64Decode(widget.base64String.replaceAll(RegExp(r'\s+'), ''));

    // Get the directory for the app's documents directory
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDir.path}/image.png';

    // Write the file
    File file = File(filePath);
    await file.writeAsBytes(bytes);

    // Show a snackbar to indicate the image has been downloaded
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Image downloaded successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewProfile(),
              ),
            );
          },
        ),
        title: const Text(
          'My Documents',
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
            fontFamily: 'Montserrat',// Text color
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        /*actions: [
          IconButton(
            icon: Icon(Icons.download_rounded),
            color: ColorConstants.kPrimaryColor,
            onPressed: () {
              _downloadImage();
            },
          ),
        ],*/
        backgroundColor: Colors.white,
      ),
      body: Container(
      color: Colors.black, // Set background color to black
      child: Center(
        child: Image.memory(
          base64Decode(widget.base64String.replaceAll(RegExp(r'\s+'), '')),
          fit: BoxFit.cover, // Cover the entire screen
          width: double.infinity, // Ensure image fills the width of the screen
          height: double.infinity, // Ensure image fills the height of the screen
        ),
      ),
    ),
    );
  }

}


void main() {
  runApp(MaterialApp(
    home: PdfView(
      base64String: "YOUR_BASE64_STRING_HERE",
    ),
  ));
}
