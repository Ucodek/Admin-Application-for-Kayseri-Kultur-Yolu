import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickView extends StatefulWidget {
  const ImagePickView({super.key});

  @override
  State<ImagePickView> createState() => _ImagePickViewState();
}

class _ImagePickViewState extends State<ImagePickView> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: image == null ? null : Image.file(File(image!.path)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getImage();
        },
      ),
    );
  }

  Future<void> getImage() async {
    /*  const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png'],
    );
    image = await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    */
    var response = await testCompressAsset("assets/error.png");

    setState(() {
      inspect(response);
    });
  }

  Future<Uint8List?> testCompressAsset(String assetName) async {
    var list = await FlutterImageCompress.compressAssetImage(assetName,
        minHeight: 1920,
        minWidth: 1080,
        quality: 96,
        rotate: 180,
        format: CompressFormat.png);

    return list;
  }
}
