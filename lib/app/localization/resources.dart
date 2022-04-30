import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/fixtures/language_codes.dart';

class Resources {
  Resources(this.locale);

  final Locale locale;

  static Resources of(BuildContext context) {
    return Localizations.of<Resources>(
          context,
          Resources,
        ) ??
        Resources(const Locale(LanguageCodes.english));
  }

  Map<String, String>? _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString(
        'lib/app/localization/resources/${locale.languageCode}.json');
    log("locale Found");
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  ///translates a phrase using [key]
  ///
  ///returns its value from the localization json file
  String getResource(String key) {
    return key.isEmpty ||
            _localizedValues![key] == null ||
            _localizedValues![key]!.isEmpty
        ? key
        : _localizedValues![key]!;
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<Resources> delegate =
      _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<Resources> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<Resources> load(Locale locale) async {
    Resources localization = Resources(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Resources> old) => false;
}
