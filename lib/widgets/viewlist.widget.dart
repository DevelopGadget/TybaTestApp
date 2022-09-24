import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:typatestapp/models/university.model.dart';
import 'package:typatestapp/widgets/details.widget.dart';
import 'package:typatestapp/widgets/imageavatar.widget.dart';

class ViewList extends StatelessWidget {
  final List<University> universities;
  final ScrollController controller;

  const ViewList({super.key, required this.universities, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        if (index < universities.length) {
          return Card(
            elevation: 30,
            child: ListTile(
              leading: ImageAvatar(
                  radius: 24, image: universities[index].image, margin: 0),
              title: Text(universities[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: Details(index: index),
                    type: PageTransitionType.rightToLeftWithFade,
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_right_rounded),
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
      itemCount: universities.length + 1,
    );
  }
}
