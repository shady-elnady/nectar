import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({
    this.locale,
  });

  static const List<String> appLanguages = [
    "en",
    "ar",
    "fr",
    "es",
  ];
  static List<Locale> supportedLocales =
      appLanguages.map((String lang) => Locale(lang)).toList();

  // ignore: unnecessary_nullable_for_final_variable_declarations
  static const Locale? defaultLocale = Locale("es");

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future loadJsonLanguage() async {
    String jsonString = await rootBundle
        .loadString("assets/languages/${locale!.languageCode}.json");

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key] ?? "";
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.appLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
