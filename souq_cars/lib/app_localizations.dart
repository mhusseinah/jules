import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';
import 'l10n/app_localizations_ar.dart';
import 'l10n/app_localizations_en.dart';

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
      final instance = AppLocalizations.delegate.
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
