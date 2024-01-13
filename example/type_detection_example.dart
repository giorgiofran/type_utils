import 'package:type_utils/type_detection.dart';

class SubDateTime extends DateTime {
  SubDateTime(super.year);
}

void main() {
  var instance = SubDateTime(2020);
  print(rockBottomType(instance)); // SubDateTime
  DateTime instance1 = SubDateTime(2020);
  print(rockBottomType(instance1)); // DateTime
  print(instanceType(instance1)); // SubDateTime
}
