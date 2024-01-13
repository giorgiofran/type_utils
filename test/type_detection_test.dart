import 'package:test/test.dart';
import 'package:type_utils/type_detection.dart';

class SubDateTime extends DateTime {
  SubDateTime(super.year);
}

void main() {
  group('RockBottom Literal', () {
    test('Plain type', () {
      expect(rockBottomType<String>(), String);
      expect(rockBottomType<List>(), List);
      expect(rockBottomType<Map>(), Map);
    });
    test('Type with generics', () {
      expect('${rockBottomType<List<String>>()}', 'List<String>');
      expect(
          '${rockBottomType<Map<String, dynamic>>()}', 'Map<String, dynamic>');
      expect('${rockBottomType<Map>()}', 'Map<dynamic, dynamic>');
    });
    test('Plain nullable type', () {
      expect(rockBottomType<String?>().toString(), 'String?');
      expect(rockBottomType<List?>().toString(), 'List<dynamic>?');
      expect(rockBottomType<Map?>().toString(), 'Map<dynamic, dynamic>?');
    });
    test('Nullable Type with generics', () {
      expect('${rockBottomType<List<String?>>()}', 'List<String?>');
      expect('${rockBottomType<Map<String?, dynamic>?>()}',
          'Map<String?, dynamic>?');
      expect('${rockBottomType<Map?>()}', 'Map<dynamic, dynamic>?');
    });
  });
  group('RockBottom Instance', () {
    test('Plain type', () {
      expect(rockBottomType(String), String);
      expect(rockBottomType(''), String);
      expect(rockBottomType(List), List);
      expect(rockBottomType([]), List);
      var type = Map;
      expect(rockBottomType(type), Map);
      expect(rockBottomType(type).toString(), 'Map<dynamic, dynamic>');
      expect(rockBottomType({}), Map);
      expect(rockBottomType(null), Null);
    });
    test('Type with generics', () {
      expect('${rockBottomType(<String>[])}', 'List<String>');
      expect('${rockBottomType(<String, dynamic>{})}', 'Map<String, dynamic>');
      expect('${rockBottomType({true: 'm1', false: 1})}', 'Map<bool, Object>');
      expect('${{true: 'm1', false: 1}.runtimeType}', '_Map<bool, Object>');
      expect('${rockBottomType({true: 'm1', 1.0: 1})}', 'Map<Object, Object>');
    });
    test('Instances', () {
      var instance = SubDateTime(2020);
      expect(rockBottomType(instance), SubDateTime);
      DateTime instance1 = SubDateTime(2020);
      expect(rockBottomType(instance1), DateTime);
    });
  });

  group('Instance Object', () {
    test('Plain type', () {
      expect(instanceType(String), String);
      expect(instanceType(''), String);
      expect(instanceType(List), List);
      expect(identical(instanceType(List), List), isTrue);
      // The List instance is a class with the same name as the abstract List
      // Changed recently
      expect(identical(instanceType([]), List), isTrue);
      var type = Map;
      expect(instanceType(type), Map);
      expect(instanceType(type).toString(), 'Map<dynamic, dynamic>');
      expect('${instanceType({})}', '_Map<dynamic, dynamic>');
      expect(identical(instanceType(SubDateTime(2020)), SubDateTime), isTrue);
    });
    test('Type with generics', () {
      expect('${instanceType(<String>[])}', 'List<String>');
      expect('${instanceType(<String, dynamic>{})}', '_Map<String, dynamic>');
      expect('${instanceType({true: 'm1', false: 1})}', '_Map<bool, Object>');
      expect('${{true: 'm1', false: 1}.runtimeType}', '_Map<bool, Object>');
      expect('${instanceType({true: 'm1', 1.0: 1})}', '_Map<Object, Object>');
    });
    test('Instances', () {
      var instance = SubDateTime(2020);
      expect(instanceType(instance), SubDateTime);
      DateTime instance1 = SubDateTime(2020);
      expect(instanceType(instance1), SubDateTime);
    });
  });
}
