import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:typatestapp/providers/translate.provider.dart';
import 'package:typatestapp/providers/universities.provider.dart';
import 'package:typatestapp/widgets/imageavatar.widget.dart';

class Details extends StatelessWidget {
  final int index;
  static ImagePicker picker = ImagePicker();
  const Details({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final translate = Translate.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translate!.text('Detail', 'Title')),
        centerTitle: true,
        elevation: 10,
      ),
      body: Consumer<UniversitiesProvider>(
        builder: (context, value, _) => ListView(
          padding: const EdgeInsets.all(20.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Center(child: ImageAvatar(radius: 148, image: value.universities[index].image, margin: 8)),
            const SizedBox(height: 15),
            textList('Nombre: ${value.universities[index].name}'),
            textList('País: ${value.universities[index].country}'),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonCamera(ImageSource.gallery, value, Icons.grid_view_rounded, 'heroBtnGallery'),
                buttonCamera(ImageSource.camera, value, Icons.camera_alt_rounded, 'heroBtnCamera'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buttonCamera(ImageSource src, UniversitiesProvider provider, IconData icon, String tag) {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: () async {
        final XFile? image = await picker.pickImage(source: src);
        if (image != null) {
          provider.setUniversityImage(image, index);
        }
      },
      child: Icon(icon),
    );
  }

  Widget textList(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20.0),
    );
  }
}
