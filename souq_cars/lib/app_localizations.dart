import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

// This is a temporary workaround until I can run `flutter gen-l10n`
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
  Future<AppLocalizations> load(Locale locale) {
    // This is a temporary workaround
    return Future.value(FakeAppLocalizations());
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

class FakeAppLocalizations implements AppLocalizations {
  @override
  String get souqCars => "Souq Cars";
  @override
  String get searchForCars => "Search for cars...";
  @override
  String get login => "Login";
  @override
  String get signup => "Signup";
  @override
  String get addCar => "Add Car";
  @override
  String get favorites => "Favorites";
  @override
  String get brand => "Brand";
  @override
  String get model => "Model";
  @override
  String get year => "Year";
  @override
  String get price => "Price";
  @override
  String get imageUrl => "Image URL";
  @override
  String get location => "Location";
  @override
  String get add => "Add";
  @override
  String get edit => "Edit";
  @override
  String get delete => "Delete";
  @override
  String get chat => "Chat";
  @override
  String get buyer => "Buyer";
  @override
  String get seller => "Seller";
  @override
  String get message => "Message";
  @override
  String get cancel => "Cancel";
  @override
  String get apply => "Apply";
  @override
  String get minPrice => "Min Price";
  @override
  String get maxPrice => "Max Price";

  @override
  final String _localeName = 'en';
}
