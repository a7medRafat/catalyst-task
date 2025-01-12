import 'package:flutter/material.dart';

import '../utils/placeholder.dart';

class AppFunctions {
  Widget imageHandler({required String img}) {
    if (img.isEmpty || !Uri.tryParse(img)!.hasAbsolutePath) {
      return const CircleAvatar(
        backgroundColor: Colors.grey,
        child: ImgPlaceHolder(),
      );
    }

    return FutureBuilder<Image>(
      future: _loadImage(img),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircleAvatar(
            backgroundColor: Colors.grey,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          return const CircleAvatar(
            backgroundColor: Colors.grey,
            child: ImgPlaceHolder(),
          );
        } else {
          return CircleAvatar(
            backgroundImage: snapshot.data!.image,
          );
        }
      },
    );
  }

  Future<Image> _loadImage(String url) async {
    try {
      final NetworkImage networkImage = NetworkImage(url);
      await networkImage.obtainKey(const ImageConfiguration());
      return Image(image: networkImage);
    } catch (e) {
      throw Exception('Failed to load image: $e');
    }
  }
}
