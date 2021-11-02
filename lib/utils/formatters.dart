import 'package:intl/intl.dart';

extension StringFormatters on String {
  String toBRLDateFormat() {
    var date = DateFormat("yyy-MM-dd").parse(this);
    return DateFormat("dd/MM/y").format(date);
  }

  String toYearFormat() {
    var date = DateFormat("yyy-MM-dd").parse(this);
    return DateFormat("y").format(date);
  }
}
