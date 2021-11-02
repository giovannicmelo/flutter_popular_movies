import 'package:flutter/widgets.dart';

import '../ui/views/screens/movie_details_screen.dart';
import '../ui/views/screens/movies_list_screen.dart';

class Routes {
  Routes._();

  static const String home = '/';
  static const String details = '/details';

  static final routes = <String, WidgetBuilder>{
    home: (context) => MoviesListScreen(),
    //details: (context) => MovieDetailsScreen(),
  };
}
