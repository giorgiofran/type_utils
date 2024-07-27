part of 'union_type.dart';

abstract class MultiUnionType<T1, T2, T3, T4, T5> {
  MultiUnionType(dynamic value)
      : valueOne = _assignValue<T1>(value),
        valueTwo = _assignValue<T2>(value),
        valueThree = _assignValue<T3>(value),
        valueFour = _assignValue<T4>(value),
        valueFive = _assignValue<T5>(value);

  dynamic get value =>
      valueOne ?? valueTwo ?? valueThree ?? valueFour ?? valueFive;
  bool get isNull => value == null;

  final T1? valueOne;
  final T2? valueTwo;
  final T3? valueThree;
  final T4? valueFour;
  final T5? valueFive;
}
