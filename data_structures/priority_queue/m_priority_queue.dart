enum HeapType { MAX, MIN }

class MPriorityQueue {
  late List<int> _list;
  late HeapType _heapType;
  int _nextIndex = 0;

  MPriorityQueue([HeapType type = HeapType.MAX]) {
    _list = [];
    _heapType = type;
  }

  get size => _list.length;

  void _verifyUpHeapOrderProperty(int index) {
    int childIndex = index;
    int parentIndex = (childIndex - 1) ~/ 2;
    while (_heapType == HeapType.MIN
        ? childIndex != 0 && _list[parentIndex] > _list[childIndex]
        : childIndex != 0 && _list[parentIndex] < _list[childIndex]) {
      int temp = _list[parentIndex];
      _list[parentIndex] = _list[childIndex];
      _list[childIndex] = temp;
      childIndex = parentIndex;
      parentIndex = (childIndex - 1) ~/ 2;
    }
  }

  void add(int value) {
    _list.add(value);
    _verifyUpHeapOrderProperty(_nextIndex);
    _nextIndex++;
  }

  void _verifyDownHeapOrderProperty(int index) {
    int parentIndex = index;
    int leftChildIndex = (2 * parentIndex + 1);
    int rightChildIndex = (2 * parentIndex + 2);

    while (leftChildIndex < _list.length) {
      int finalIndex = parentIndex;
      if (_heapType == HeapType.MIN ? _list[finalIndex] > _list[leftChildIndex] :
      _list[finalIndex] < _list[leftChildIndex]) {
        finalIndex = leftChildIndex;
      }
      if (rightChildIndex < _list.length) {
        if (_heapType == HeapType.MIN ? _list[finalIndex] > _list[rightChildIndex]:
        _list[finalIndex] < _list[rightChildIndex]) {
          finalIndex = rightChildIndex;
        }
      }
      if (finalIndex == parentIndex) {
        break;
      }
      int temp = _list[finalIndex];
      _list[finalIndex] = _list[parentIndex];
      _list[parentIndex] = temp;
      parentIndex = finalIndex;
      leftChildIndex = (2 * parentIndex + 1);
      rightChildIndex = (2 * parentIndex + 2);
    }
  }

  int remove() {
    if (isEmpty()) {
      throw Exception(
          "Priority Queue is empty therefore cannot remove the item.");
    }
    int item = _list[0];
    _list[0] = _list[_list.length - 1];
    _list.removeAt(_list.length - 1);
    --_nextIndex;
    _verifyDownHeapOrderProperty(0);
    return item;
  }

  int get() {
    if (isEmpty()) {
      throw Exception(
          "Your Priority Queue is empty, please insert items in it.");
    }
    return _list[0];
  }

  bool isEmpty() {
    return _list.length == 0;
  }
}
