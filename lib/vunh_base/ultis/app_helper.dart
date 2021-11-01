import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Helper {
  static String formatCurrency(double value) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
      amount: value,
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
      ),
    );
    return fmf.output.withoutFractionDigits;
  }
}
