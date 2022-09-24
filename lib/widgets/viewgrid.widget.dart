import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:typatestapp/models/university.model.dart';
import 'package:typatestapp/widgets/details.widget.dart';
import 'package:typatestapp/widgets/imageavatar.widget.dart';

class ViewGrid extends StatelessWidget {
  final List<University> universities;
  final ScrollController controller;
  const ViewGrid(
      {super.key, required this.universities, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: universities.length + 1,
      itemBuilder: (context, index) {
        if (index < universities.length) {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: Details(index: index),
                      type: PageTransitionType.rightToLeftWithFade,
                    ),
                  );
                },
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 6.0,
                  runSpacing: 4.0,
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.center,
                  children: [
                    Center(
                      child: ImageAvatar(
                        radius: 44,
                        image: universities[index].image,
                        margin: 2,
                      ),
                    ),
                    Center(
                      child: Text(
                        universities[index].name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
