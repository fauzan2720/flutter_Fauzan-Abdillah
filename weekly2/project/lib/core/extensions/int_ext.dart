import 'package:intl/intl.dart';

extension StringExt on int {
  String get currencyFormatIDR => NumberFormat.currency(
        locale: 'id',
        symbol: 'IDR ',
        decimalDigits: 0,
      ).format(this);

  String get numberFormat => NumberFormat.currency(
        locale: 'id',
        symbol: '',
        decimalDigits: 0,
      ).format(this);
}
