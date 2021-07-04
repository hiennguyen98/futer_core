
import 'package:intl/intl.dart';

class DateUtils{
  static const String EN_LOCATE = 'en_US';

  static final DateFormat _dayFormat = new DateFormat("dd");
  static final DateFormat _monthFormat = new DateFormat("MM");
  static final DateFormat _yearFormat = new DateFormat("yyyy");
  static final DateFormat _firstDayFormat = new DateFormat("MMM dd");
  static final DateFormat _fullDayFormat =
  new DateFormat("dd-MM-yyyy HH:mm:ss");
  static final DateFormat _commDayFormat = new DateFormat("yyyy-MM-dd");
  static final DateFormat _viDayFormat = new DateFormat("dd/MM/yyyy");
  static final DateFormat _fullViDayFormat =
  new DateFormat("HH:mm:ss, dd/MM/yyyy");

  static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);
  static String commDayFormat(DateTime d) => _commDayFormat.format(d);
  static String fullViDayFormat(DateTime d) => _fullViDayFormat.format(d);
  static String viDayFormat(DateTime d) => _viDayFormat.format(d);

}