import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:azblob/azblob.dart';
import 'package:mime/mime.dart';

Future<String> uploadImageToAzure(Uint8List image) async {
  try {
    String fileName = DateTime.now().toString();
    var storage = AzureStorage.parse(
        'DefaultEndpointsProtocol=https;AccountName=cuiblob;AccountKey=7HPIx1SCsg48/NL8FTpfgNx9DfUXNM5CvOo+0KEB9BpCdvH4/d33M8qU96G/bwXTEwFRKusqwhlG+AStkhs0tQ==;EndpointSuffix=core.windows.net');
    String container = "profilepictures";

    String? contentType = lookupMimeType(fileName);
    await storage.putBlob('/$container/$fileName',
        bodyBytes: image, contentType: contentType, type: BlobType.BlockBlob);
    return fileName;
  } on AzureStorageException catch (ex) {
    throw ex;
  } catch (err) {
    throw err;
  }
}

Future<String> uploadSocietyTImageToAzure(Uint8List image) async {
  try {
    String fileName = DateTime.now().toString();
    var storage = AzureStorage.parse(
        'DefaultEndpointsProtocol=https;AccountName=cuiblob;AccountKey=7HPIx1SCsg48/NL8FTpfgNx9DfUXNM5CvOo+0KEB9BpCdvH4/d33M8qU96G/bwXTEwFRKusqwhlG+AStkhs0tQ==;EndpointSuffix=core.windows.net');
    String container = "societytweetspictures";

    String? contentType = lookupMimeType(fileName);
    await storage.putBlob('/$container/$fileName',
        bodyBytes: image, contentType: contentType, type: BlobType.BlockBlob);
    return fileName;
  } on AzureStorageException catch (ex) {
    throw ex;
  } catch (err) {
    throw err;
  }
}
