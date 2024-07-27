part of 'union_type.dart';

abstract class HugeUnionType<T1, T2, T3, T4, T5, T6, T7, T8, T9> {
  HugeUnionType(dynamic value)
      : valueOne = _assignValue<T1>(value),
        valueTwo = _assignValue<T2>(value),
        valueThree = _assignValue<T3>(value),
        valueFour = _assignValue<T4>(value),
        valueFive = _assignValue<T5>(value),
        valueSix = _assignValue<T6>(value),
        valueSeven = _assignValue<T7>(value),
        valueEight = _assignValue<T8>(value),
        valueNine = _assignValue<T9>(value);

  dynamic get value =>
      valueOne ??
      valueTwo ??
      valueThree ??
      valueFour ??
      valueFive ??
      valueSix ??
      valueSeven ??
      valueEight ??
      valueNine;
  bool get isNull => value == null;

  final T1? valueOne;
  final T2? valueTwo;
  final T3? valueThree;
  final T4? valueFour;
  final T5? valueFive;
  final T6? valueSix;
  final T7? valueSeven;
  final T8? valueEight;
  final T9? valueNine;
}
