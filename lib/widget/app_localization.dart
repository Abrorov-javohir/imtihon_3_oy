// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AppLocalizations {
//   static Future<AppLocalizations> load(Locale locale) {
//     final String name = locale.countryCode?.isEmpty ?? false
//         ? locale.languageCode
//         : locale.toString();
//     final String localeName = Intl.canonicalizedLocale(name);
//     return initializeMessages(localeName).then((_) {
//       Intl.defaultLocale = localeName;
//       return AppLocalizations();
//     });
//   }

//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
//   }

//   String get title {
//     return Intl.message('Select Language', name: 'title');
//   }

//   String get language {
//     return Intl.message('Language', name: 'language');
//   }
// }

// class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) =>
//       ['en', 'uz', 'ru'].contains(locale.languageCode);

//   @override
//   Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

//   @override
//   bool shouldReload(AppLocalizationsDelegate old) => false;
// }
