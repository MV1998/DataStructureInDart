class DoublyLinkedList<T> {
  late T data;
  DoublyLinkedList<T>? prev;
  DoublyLinkedList<T>? next;

  DoublyLinkedList(T data) {
    this.data = data;
    this.prev = null;
    this.next = null;
  }
}

class LinkedList<T> {
  T data;
  LinkedList<T>? next;

  LinkedList(this.data);
}