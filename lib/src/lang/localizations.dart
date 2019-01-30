import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String name =
        locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    //await initializeMessages(canonicalLocaleName);
    Intl.defaultLocale = localeName;
    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) =>
    Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get title {
    return Intl.message('Hello world App', name: 'title', desc: 'The application title');
  }
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