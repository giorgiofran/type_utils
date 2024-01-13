import 'package:type_utils/type_utils.dart';
import 'package:test/test.dart';

class Tin extends Implementer<String> {
  const Tin(super.string);
}

class Tin2 extends Implementer<String> {
  const Tin2(super.string);
}

void main() {
  group('Implementer', () {
    test('Basic', () {
      const code = Tin('abc');
      var code2 = Tin('abc');
      const code3 = Tin('abc');
      const code4 = Tin2('abc');

      expect(code(), 'abc');

      var dd = code;
      expect(code, isA<Tin>());
      expect(dd, isA<Tin>());

      var c = code;
      expect(c.call(), 'abc');
      expect(Tin('abc'), code);
      expect(code == Tin2('abc'), isFalse);

      expect(identical(c, code), isTrue);
      expect(identical(code2, code), isFalse);
      expect(identical(code3, code), isTrue);
      expect(identical(code4, code), isFalse);

      expect(identical(Tin('abc'), code), isFalse);

      expect(Tin('abd') == code, isFalse);
      expect(c, code);
    });
  });
}
