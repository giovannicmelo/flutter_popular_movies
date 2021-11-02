import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_popular_movies/data/models/movie.dart';
import 'package:flutter_popular_movies/ui/views/screens/movie_details_screen.dart';
import 'package:logging/logging.dart';

import './configs/routes.dart';
import './configs/strings.dart';
import './configs/theme.dart';
import './di/service_locators.dart';

void main() async {
  _setupLogging();
  await setupLocator();
  runApp(MoviesApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.themeData,
      routes: Routes.routes,
      onGenerateRoute: (settings) {
        if (settings.name == Routes.details) {
          return MaterialPageRoute(
              builder: (ctx) =>
                  MovieDetailsScreen(movie: settings.arguments as Movie));
        } else
          return null;
      },
    );
  }
}
