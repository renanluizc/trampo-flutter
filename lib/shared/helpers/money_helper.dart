import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyHelper {
  static final controller = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
    thousandSeparator: '.',
    initialValue: 0.0,
  );

  static String parse(double value) {
    controller.updateValue(value);
    return controller.text;
  }
}
