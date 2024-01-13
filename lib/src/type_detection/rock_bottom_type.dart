/// This method allows the definition of literal types
/// with generics (at present Dart does not allow this)
/// and the detection of an object "rock-bottom" type;
/// For example, Maps are by default represented by an instance
/// of the class "_InternalLinkedHashMap", but this
/// method will return the defined (or inferred type) Map.
/// You can call it specifying the type (rockBottomType<Map>()),
/// or passing the instance (rockBottomType({}))
Type rockBottomType<T>([T? object]) {
  if (object is Type) {
    return object;
  }
  return T;
}
