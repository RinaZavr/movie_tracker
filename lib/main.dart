import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_tracker/src/app.dart';
import 'package:movie_tracker/src/config/repositories/settings_repository.dart';
import 'package:movies_api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final settingsRepository = SettingsRepository(prefs: prefs);
  GetIt.I.registerSingleton<SettingsRepository>(settingsRepository);

  await dotenv.load();
  final currentLocale = settingsRepository.getLocale();
  GetIt.I.registerSingleton<DioClient>(
    DioClient(
      baseUrl: dotenv.env['API_URL']!,
      myApiKey: dotenv.env['API_KEY'],
      currentLanguage:
          '${currentLocale.languageCode}-${currentLocale.countryCode}',
    ),
  );

  runApp(const App());
}
