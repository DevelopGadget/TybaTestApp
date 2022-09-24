import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:typatestapp/models/university.model.dart';

class ViewList extends StatelessWidget {
  final List<University> universities;

  const ViewList({super.key, required this.universities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        elevation: 30,
        child: ListTile(
          title: Text(universities[index].name),
          trailing: const Icon(Icons.arrow_right_rounded),
        ),
      ),
      itemCount: universities.length,
    );
  }
}
