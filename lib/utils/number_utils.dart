import 'package:intl/intl.dart';

class NumberUtils {
  static String currencyFormat(int nominal,
      [String? locale = 'ID', String? symbol = 'IDR ', int decimalDigits = 0]) {
    return NumberFormat.currency(
            locale: locale, symbol: symbol, decimalDigits: decimalDigits)
        .format(nominal);
  }
}
