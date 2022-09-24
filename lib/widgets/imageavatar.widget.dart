import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImageAvatar extends StatelessWidget {
  final Uint8List? image;
  final double radius, margin;
  final String imageNetwork =
      'https://i.revistapym.com.co/old/2022/01/logo-tyba.png';
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
