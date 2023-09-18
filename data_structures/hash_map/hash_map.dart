import 'map_node.dart';

class HashMap<V> {
  late int _count;
  late int _bucketSize;
  late List<MapNode<V>?> _buckets;

  HashMap() {
    this._count = 0;
    this._bucketSize = 12;
    this._buckets = List.filled(_bucketSize, null);
  }

  int _getBucketIndex(String key) {
    int hashCode = 0;
    int currentCoefficient = 1;
    for (int i = key.length - 1; i >= 0; i--) {
      hashCode = hashCode + key.codeUnitAt(i) * currentCoefficient;
      hashCode = hashCode % _bucketSize;
      currentCoefficient = currentCoefficient * 37;
      currentCoefficient = currentCoefficient % _bucketSize;
    }
    return hashCode % _bucketSize;
  }

  void insert(String key, V value) {
    int bucketIndex = _getBucketIndex(key);
    MapNode<V>? node = _buckets[bucketIndex];

    while (node != null) {
      if (node.key == key) {
        node.value = value;
        return;
      }
      node = node.next;
    }

    node = _buckets[bucketIndex];
    MapNode<V> newNode = MapNode(key, value);
    newNode.next = node;
    _buckets[bucketIndex] = newNode;
    _count++;

    if (loadFactor() > 0.7) {
      _rehashing();
    }
  }

  num loadFactor() {
    return _count / _bucketSize;
  }

  void _rehashing() {
    List<MapNode<V>?> tempBucket = _buckets;
    int tempBucketSize = _bucketSize;

    _buckets = List.filled(_bucketSize * 2, null);
    _bucketSize = _bucketSize * 2;
    _count = 0;
    for (int i = 0; i < tempBucketSize; i++) {
      MapNode<V>? node = tempBucket[i];
      while (node != null) {
        insert(node.key, node.value);
        node = node.next;
      }
    }
  }

  V? get(String key) {
    int bucketIndex = _getBucketIndex(key);
    MapNode<V>? node = _buckets[bucketIndex];
    while (node != null) {
      if (node.key == key) {
        return node.value;
      }
      node = node.next;
    }
    return null;
  }

  V? remove(String key) {
    int bucketIndex = _getBucketIndex(key);
    MapNode<V>? node = _buckets[bucketIndex];
    MapNode<V>? temp = null;
    while(node != null) {
      if (node.key == key) {
        MapNode<V> tempNode = node;
        if (temp != null) {
          temp.next = node.next;
        }else {
          _buckets[bucketIndex] = node.next;
        }
        _count--;
        return tempNode.value;
      }
      temp = node;
      node = node.next;
    }
    return null;
  }

  int getBucketSize() {
    return this._bucketSize;
  }

  int size() {
    return this._count;
  }

  void printBucket() {
    for (MapNode<V>? node in _buckets) {
      print(node);
    }
  }

  V? operator [](String key) {
   return get(key);
  }

  void operator []=(String key, V value) {
    insert(key, value);
  }
}