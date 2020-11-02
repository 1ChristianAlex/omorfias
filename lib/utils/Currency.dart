import 'package:intl/intl.dart';

class Currency {
  static String doubleToCurrency(double value) {
    NumberFormat _ptBrLocale = NumberFormat("R\$ #,##0.00", "pt_BR");
    return _ptBrLocale.format(value);
  }
}
