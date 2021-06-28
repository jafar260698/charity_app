import 'package:intl/intl.dart';

String currencyFormatter(double number, {decimalDigit = 2}) {
  final formatCurrency = NumberFormat.currency(
      locale: "en_US", symbol: "", decimalDigits: decimalDigit);
  return formatCurrency.format(number).replaceAll(",", " ");
}

String dateFormatter(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy hh:mm');

  return formatter.format(date);
}

String dateFormatter2(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy');

  return formatter.format(date);
}