import 'package:type_utils/type_utils.dart';

class Tin extends Implementer<String> {
  const Tin(super.string);
}

void main() {
  const code = Tin('abc');

  print('Value -> ${code.value}'); // abc
  print('Call -> ${code()}'); // abc
  print('RuntimeType -> ${code.runtimeType}'); // Tin
  // ignore: unnecessary_type_check
  print('Is -> ${code is Tin}'); // true
}
