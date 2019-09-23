class Utility {

  static bool isNullOrEmpty<T>(Iterable<T> array) {
    return array == null || array.length == 0;
  }

  static bool stringIsNullOrEmpty(String value) {
    return (value?.trim()?.isEmpty ?? true);
  }
}
