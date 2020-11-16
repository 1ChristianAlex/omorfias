import 'package:omorfias/enum/ServiceLocation.dart';

class FormContext {
  String enterpriseId;
  int serviceLocation = ServiceLocationEnum.store;

  Map<int, bool> servicesSelected = new Map<int, bool>();
  DateTime selectedDay = DateTime.now();
  List<int> selectedhours = List<int>();
  int paymentMethod;
}
