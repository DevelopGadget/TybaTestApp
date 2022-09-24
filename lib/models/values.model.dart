import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typatestapp/app.dart';
import 'package:typatestapp/providers/selectorView.provider.dart';
import 'package:typatestapp/providers/universities.provider.dart';

class Values {

  static const String jsonUrl = 'universities.json';
  static final Color background = Color(int.parse('FF22252A', radix: 16));
  static final Color primaryColor = Color(int.parse('FF2288FF', radix: 16));
  static final Color accentColor = Color(int.parse('FF1E2025', radix: 16));
  static final Color cardColor = Color(int.parse('FF343840', radix: 16));

  static Widget runApp() => MultiProvider(
        providers: [
          ChangeNotifierProvider<UniversitiesProvider>(create: (_) => UniversitiesProvider()),
          ChangeNotifierProvider<SelectorViewProvider>(create: (_) => SelectorViewProvider()),
        ],
        child: const MyApp(),
      );

}
