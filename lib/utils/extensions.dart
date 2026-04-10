import 'package:intl/intl.dart';

extension FormatDateTime on DateTime {
  String formattedDatetime() {
    return DateFormat('d MMMM, yyyy - h:mm a').format(this);
  }
}
