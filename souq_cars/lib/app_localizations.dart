import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';
import 'l10n/app_localizations_ar.dart' as messages_ar;
import 'l10n/app_localizations_en.dart' as messages_en;

abstract class AppLocalizations {
  AppLocalizations(String locale) : _localeName = Intl.canonicalizedLocale(locale.toString());

  final String _localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', ''),
    Locale('ar', ''),
  ];

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = localeName == 'ar' ? AppLocalizationsAr() : AppLocalizationsEn();
      return instance;
    });
  }

  String get souqCars;
  String get searchForCars;
  String get login;
  String get signup;
  String get addCar;
  String get favorites;
  String get brand;
  String get model;
  String get year;
  String get price;
  String get imageUrl;
  String get location;
  String get add;
  String get edit;
  String get delete;
  String get chat;
  String get buyer;
  String get seller;
  String get message;
  String get cancel;
  String get apply;
  String get minPrice;
  String get maxPrice;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<bool> initializeMessages(String localeName) async {
  final availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => findExact(locale) != null,
    onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  final lookup = findExact(availableLocale);
  if (lookup == null) {
    return Future.value(false);
  }

  // This is a temporary workaround
  // In a real app, you would use the generated messages files
  // to initialize the message lookup.
  initializeInternalMessageLookup(() => lookup);
  return Future.value(true);
}

MessageLookupByLibrary? findExact(String locale) {
  switch (locale) {
    case 'ar':
      return messages_ar.messages;
    case 'en':
      return messages_en.messages;
    default:
      return null;
  }
}
