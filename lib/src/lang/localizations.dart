import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String name =
        locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) =>
    Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get title => Intl.message('Hello world App', name: 'title', desc: 'The application title');
  String get home => Intl.message('Home', name: 'home', desc: 'The application title');
  String get search => Intl.message('Search', name: 'search', desc: 'The application title');
  String get playing => Intl.message('Playing', name: 'playing', desc: 'The application title');
  String get library => Intl.message('Library', name: 'library', desc: 'The application title');
  String get options => Intl.message('Options', name: 'options', desc: 'The application title');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en','it','fr','pt','ja','ru','pl','ko','zh','de','ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}