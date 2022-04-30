import 'package:intl/intl.dart';

mixin CommonHelper {
  /// checks if [text] is a valid email  address
  ///
  /// returns `true` if [text] is a valid Email and `false` otherwise
  static bool validateEmail({required String? text}) {
    ///follows nopcommerce Standards
    final RegExp _regExp = RegExp(
        r"""^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0
    -\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)(
    (((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u0
    0A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF
    ]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a
    -z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-||_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|
    \d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+|(([a-z]|[\u00
    A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+([a-z]+|\d|-|\.{0,1}|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])?([a-z]|[\
    u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$""");
    if (text != null || text!.isNotEmpty) {
      return _regExp.hasMatch(text) ? true : false;
    } else {
      return false;
    }
  }

  /// checks if [text] is a valid signed integer
  ///
  /// returns null by default and a localized error message if the [text] is not a valid numeric value
  ///
  /// [positiveOnly] can be overridden to check for only positive values
  ///
  static bool validateNumeric(
      {required String? text, bool positiveOnly = false}) {
    final RegExp _regExp = RegExp(
        r"^[+-]?([0-9]+[.])?[0-9]+$"); //matches "[int]", "[int].[int]", and "-[int].[int]"
    final RegExp _regExpPositive =
        RegExp(r"^([0-9]+[.])?[0-9]+$"); //matches "[int]",and "[int].[int]"
    return text == null || text.isEmpty
        ? false
        : positiveOnly
            ? _regExpPositive.hasMatch(text)
                ? true
                : false
            : _regExp.hasMatch(text)
                ? true
                : false;
  }

  /// returns null by default and a localized error message if the [text] is not a valid Url
  ///
  static bool validateUrl({required String? text}) {
    final RegExp _regExp = RegExp(
        r"[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");
    return text == null || text.isEmpty
        ? false
        : _regExp.hasMatch(text)
            ? true
            : false;
  }

  /// returns a string with the formatted Date
  ///
  /// override [timeOriented] to change the date format so that it shows
  ///
  /// a time based date rather than a year based date
  ///
  static String formatDate({
    required DateTime date,
    bool timeOnly = false,
    bool withTime = false,
  }) {
    //following the format in nopcommerce
    final DateFormat formatter = withTime
        ? DateFormat('yyyy - MM - dd hh:mm a')
        : timeOnly
            ? DateFormat('hh:mm a')
            : DateFormat('yyyy - MM - dd');
    return formatter.format(date);
  }

  static DateTime get emptyDate => DateTime.parse("0001-01-01T01:01:00.000Z");

  static String get emptyDateString => "0001-01-01T01:01:00.000Z";
}
