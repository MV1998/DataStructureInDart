
import 'm_priority_queue.dart';

void main() {
  MPriorityQueue queue = MPriorityQueue(HeapType.MAX);
  queue.add(2);
  queue.add(1);
  queue.add(111);
  queue.add(0);
  queue.add(109);
  queue.add(203);
  queue.add(11);
  print(queue.get());
  // print(queue.size);
  print(queue.remove());
  print(queue.remove());
  print(queue.remove());
  print(queue.remove());
  print(queue.remove());
  print(queue.remove());
  print(queue.remove());
}