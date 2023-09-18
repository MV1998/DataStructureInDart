
class MapNode<V> {
  late String key;
  late V value;
  MapNode<V>? next;

  MapNode(String key, V value) {
    this.key = key;
    this.value = value;
    next = null;
  }
}