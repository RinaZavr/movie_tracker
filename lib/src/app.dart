import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/common/notifiers/localization_notifier.dart';
import 'package:movie_tracker/src/common/notifiers/theme_notifier.dart';
import 'package:movie_tracker/src/config/localization/app_localizations.dart';
import 'package:movie_tracker/src/config/router/router.dart';
import 'package:movie_tracker/src/config/styles/themes.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter _router;

  @override
  void initState() {
    _router = AppRouter.router;

    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LocalizationNotifier()),
      ],
      child: Consumer2<ThemeNotifier, LocalizationNotifier>(
        builder: (context, theme, locale, child) => _App(router: _router),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: AppThemes.dark(context),
      theme: AppThemes.light(context),
      themeMode: context.theme.themeMode,
      locale: context.localization.locale,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
