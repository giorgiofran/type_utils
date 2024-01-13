import 'package:type_utils/type_detection.dart';

void main() {
  var t1 = <dynamic>['abacab'];
  print('t1 - base = ${rockBottomType(t1)}');
  print('t1 - runTime = ${instanceType(t1)}');
  var ts = <String>[for (var el in t1) el as String];
  var ts2 = <String?>[...t1];
  //var ts3 = <String?>[]..addAll(t1);

  print('ts - base = ${rockBottomType(ts)}');
  print('ts - runTime = ${instanceType(ts)}');
  //print(ts3);
  print(ts2);

  var ty1 = String;
  var ty2 = rockBottomType<String?>();

  print('$ty1 $ty2');
}
