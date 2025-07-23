import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_tracker/src/app.dart';
import 'package:movie_tracker/src/config/repositories/settings_repository.dart';
import 'package:movies_api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final settingsRepository = SettingsRepository(prefs: prefs);
  GetIt.I.registerSingleton<SettingsRepository>(settingsRepository);

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);

  await dotenv.load();
  final currentLocale = settingsRepository.getLocale();
  GetIt.I.registerSingleton<DioClient>(
    DioClient(
      baseUrl: dotenv.env['API_URL']!,
      myApiKey: dotenv.env['API_KEY'],
      currentLanguage:
          '${currentLocale.languageCode}-${currentLocale.countryCode}',
      logger: TalkerDioLogger(
        talker: talker,
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseData: false,
        ),
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(const App());
}
