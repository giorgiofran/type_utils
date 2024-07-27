part 'multi_union_type.dart';
part 'huge_union_type.dart';

abstract class UnionType<T1, T2> {
  UnionType(dynamic value)
      : valueOne = _assignValue<T1>(value),
        valueTwo = _assignValue<T2>(value);

  dynamic get value => valueOne ?? valueTwo;
  bool get isNull => value == null;

  final T1? valueOne;
  final T2? valueTwo;

  @override
  bool operator ==(other) => other is UnionType && value == other.value;

  @override
  int get hashCode => Object.hash(valueOne, valueTwo);
}

T? _assignValue<T>(value) {
  if (value == null) {
    return null;
  } else if (value is T) {
    return value;
  } else if (value is Map) {
    return _convertMap<T>(value);
  } else if (value is List) {
    return _convertList<T>(value);
  }
  return null;
}

M? _convertMap<M>(Map map) {
  M ret;
  try {
    ret = map as M;
  } catch (e) {
    return null;
  }
  return ret;
}

L? _convertList<L>(List list) {
  L ret;
  try {
    ret = list as L;
  } catch (e) {
    return null;
  }
  return ret;
}
