import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImageAvatar extends StatelessWidget {
  final Uint8List? image;
  final double radius, margin;
  final String imageNetwork =
      'https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found-300x225.jpg';
  const ImageAvatar({super.key, required this.radius, this.image, required this.margin});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: CircleAvatar(
        backgroundImage: image == null
            ? NetworkImage(imageNetwork)
            : MemoryImage(image!) as ImageProvider, //NetworkImage
        radius: radius - margin,
      ),
    );
  }
}
