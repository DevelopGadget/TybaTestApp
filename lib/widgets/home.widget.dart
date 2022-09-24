import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typatestapp/providers/selectorView.provider.dart';
import 'package:typatestapp/providers/translate.provider.dart';
import 'package:typatestapp/providers/universities.provider.dart';
import 'package:typatestapp/widgets/viewgrid.widget.dart';
import 'package:typatestapp/widgets/viewlist.widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = Translate.of(context);
    Provider.of<UniversitiesProvider>(context, listen: false).getUniversities();
    return Scaffold(
      appBar: AppBar(
        title: Text(translate!.text('Home', 'Title')),
        centerTitle: true,
        elevation: 10,
      ),
      floatingActionButton: Consumer<SelectorViewProvider>(
        builder: (context, value, _) => FloatingActionButton(
          onPressed: () {
            value.changeSelectorView(!value.isGridView);
          },
          child: Icon(value.isGridView ? Icons.grid_view_rounded : Icons.list_rounded, size: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer2<SelectorViewProvider, UniversitiesProvider>(
          builder: (context, selectorValue, universitiesValue, _) {
            if(selectorValue.isGridView) {
              return ViewGrid(universities: universitiesValue.universities);
            }
            return ViewList(universities: universitiesValue.universities);
          },
        ),
      ),
    );
  }
}
