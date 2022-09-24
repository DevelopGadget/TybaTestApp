import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translate {
  Translate(this.locale);

  final Locale locale;

  static Translate? of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  static Map<String, dynamic>? _localizedValues;

  String text(String widget, String key) {
    return _localizedValues?[widget][key] ?? '** $key not found';
  }

  static Future<Translate> load(Locale locale) async {
    Translate translations = Translate(locale);
    String jsonContent =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    if (jsonContent.isEmpty) {
      jsonContent = await rootBundle.loadString('assets/lang/en.json');
    }
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class TranslateDelegate extends LocalizationsDelegate<Translate> {
  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<Translate> load(Locale locale) => Translate.load(locale);

  @override
  bool shouldReload(TranslateDelegate old) => false;
}
