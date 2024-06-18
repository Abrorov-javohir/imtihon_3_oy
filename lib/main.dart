import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/screens/favoritescreen.dart';
import 'package:imtihon_3_oy/screens/login.dart';
import 'package:imtihon_3_oy/view_model/favourites_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesViewModel(),
      child: EasyLocalization(
        supportedLocales: const [
          Locale("uz"),
          Locale("en"),
          Locale("ru"),
        ],
        path: "resources/langs",
        startLocale: const Locale("ru"),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Login(),
          '/favorites': (context) => const FavoritesPage(),
        },
      ),
    );
  }
}
