import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:azblob/azblob.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

void main() {
  runApp(MyApp()); // Run the Flutter app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlobTest(), // Use the BlobTest widget as the home screen
    );
  }
}

class BlobTest extends StatefulWidget {
  @override
  _BlobTestState createState() => _BlobTestState();
}

class _BlobTestState extends State<BlobTest> {
  @override
  Widget build(BuildContext context) {
    // You can call uploadImageToAzure here with the appropriate assetImagePath
    uploadImageToAzure(context, "lib\\Assets\\icons8-circled-envelope-48.png");

    return Scaffold(
      appBar: AppBar(
        title: Text('Azure Blob Storage Test'),
      ),
      body: Center(
        child: Text('Uploading image to Azure Blob Storage...'),
      ),
    );
  }
}

Future<void> uploadImageToAzure(BuildContext context, String assetImagePath) async {
  try {
    ByteData byteData = await DefaultAssetBundle.of(context).load(assetImagePath);
    Uint8List content = byteData.buffer.asUint8List();

    String fileName = p.basename(assetImagePath);
    var storage = AzureStorage.parse('DefaultEndpointsProtocol=https;AccountName=cuiblob;AccountKey=7HPIx1SCsg48/NL8FTpfgNx9DfUXNM5CvOo+0KEB9BpCdvH4/d33M8qU96G/bwXTEwFRKusqwhlG+AStkhs0tQ==;EndpointSuffix=core.windows.net');
    String container = "profilepictures";

    String? contentType = lookupMimeType(fileName);

    await storage.putBlob(
      '$container/$fileName',
      bodyBytes: content,
      contentType: contentType,
      type: BlobType.BlockBlob,
    );
    print("done");
  } on AzureStorageException catch (ex) {
    print(ex.message);
  } catch (err) {
    print(err);
  }
}
