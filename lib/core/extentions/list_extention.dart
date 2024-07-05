// list_extensions.dart
extension ListExtensions<T> on List<T> {
  bool isFirstElement(T element) {
    print(element.toString());
    if (isEmpty) return false;
    return first == element;
  }

  bool isLastElement(T element) {
    if (isEmpty) return false;
    return last == element;
  }
}