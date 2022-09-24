import 'package:flutter/material.dart';
import 'package:typatestapp/models/university.model.dart';

class ViewGrid extends StatelessWidget {
  final List<University> universities;
  const ViewGrid({super.key, required this.universities});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: universities.length,
      itemBuilder: (context, index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 30,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 6.0,
          runSpacing: 4.0,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,     
          children: [
            const CircleAvatar(
              radius: 45,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found-300x225.jpg'), //NetworkImage
                radius: 100,
              ),
            ),
            Text(
              universities[index].name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
