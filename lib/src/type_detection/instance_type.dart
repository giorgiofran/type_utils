/// Represents the type of the Instance of the Object.
/// For example a Map is by default represented by the instance
/// of the class "_InternalLinkedHashMap"
Type instanceType(Object object) {
  if (object is Type) {
    return object;
  }
  return object.runtimeType;
}
