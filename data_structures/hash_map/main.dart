import 'dart:io';
import 'dart:math';

import '../LinkedList/doubly_linked_list.dart';
import 'hash_map.dart';
DoublyLinkedList<String>? takeInput() {
  print("Enter entries in doubly linked list");
  DoublyLinkedList<String>? head;
  DoublyLinkedList<String>? tail;
  String? value = stdin.readLineSync();
  while (value != "-1") {
    if (head == null) {
      head = DoublyLinkedList<String>(value!);
      tail = head;
    }else {
      DoublyLinkedList<String> temp = DoublyLinkedList(value!);
      tail!.next = temp;
      temp.prev = tail;
      tail = temp;
    }
    value = stdin.readLineSync();
  }
  tail!.next = head;
  head!.prev = tail;
  return head;
}

void printDoublyLinkedList(DoublyLinkedList? head) {
  DoublyLinkedList? tail = head;
  while (tail != null) {
    print(tail.data);
    print(tail.prev == null ? "${tail.data} -> null " : "${tail.data} -> ${tail.prev!.data}");
    print(tail.next == null ? "${tail.data} -> null " : "${tail.data} -> ${tail.next!.data}");
    tail = tail.next;
  }
}


void printDoublyCircularLinkedList(DoublyLinkedList<String> head) {
  DoublyLinkedList<String> tail = head.next!;
  int hashCode = head.hashCode;
  print(head.data);
  print(head.prev == null ? "${head.data} -> null " : "${head.data} -> ${head.prev!.data}");
  print(head.next == null ? "${head.data} -> null " : "${head.data} -> ${head.next!.data}");
  while (tail.hashCode != hashCode) {
    print(tail.data);
    print(tail.prev == null ? "${tail.data} -> null " : "${tail.data} -> ${tail.prev!.data}");
    print(tail.next == null ? "${tail.data} -> null " : "${tail.data} -> ${tail.next!.data}");
    tail = tail.next!;
  }
}

int? fibo(int n) {
  List<int?> result = List.filled(n+1, null, growable: true);
  return fiboHelp(n, result);
}

// Memoization DP problem
int? fiboHelp(int n, List<int?> result) {
  if (n <= 1) {
    return n;
  }

  if (result[n] != null) {
    return result[n];
  }

  int? a = fiboHelp(n-1, result);
  int? b = fiboHelp(n-2, result);
  result.insert(n, a! + b!);
  return result[n];
}

int? minStepUsingMemoization(int n) {
  List<int?> list = List.filled(n+1, null, growable: true);
  int res = minStepUsingMemoizationHelper(n, list)!;
  print(list);
  return res;
}

int? minStepUsingMemoizationHelper(int n, List<int?> result) {
  if (n <= 1) {
    return 0;
  }

  if (result[n] != null) {
    print(result[n]);
    return result[n];
  }

  int a = double.maxFinite.toInt();
  int b = double.maxFinite.toInt();
  int c = double.maxFinite.toInt();

  a = minStepUsingMemoizationHelper(n - 1, result)!;
  if (n % 2 == 0) {
    b = minStepUsingMemoizationHelper(n ~/ 2, result)!;
  }
  if (n % 3 == 0) {
    c = minStepUsingMemoizationHelper(n ~/ 3, result)!;
  }
  int ans = min(a, min(b,c)) + 1;
  print("ans $ans");
  result.insert(n, ans);
  return result[n];
}

int minStepUsingDP(int n) {
  List<int> dp = List.filled(n + 1, -1);
  dp[1] = 0;
  for (int i = 2; i <= n; i++) {
    int a = dp[i - 1];
    int b = double.maxFinite.toInt();
    int c = double.maxFinite.toInt();

    if (i % 2 == 0) {
      b = dp[i ~/ 2];
    }

    if (i % 3 == 0) {
      c = dp[i ~/ 3];
    }

    dp[i] = min(a, min(b, c)) + 1;
    stdout.write("- ");
  }
  return dp[n];
}

int? stairCasDP(int n, List<int?> dp){
  if (n < 0) {
    return 0;
  }
  if (n == 0) {
    return 1;
  }
  if (dp[n] != null) {
    return dp[n];
  }
  int a = stairCasDP(n - 1, dp)!;
  int b = stairCasDP(n - 2, dp)!;
  int c = stairCasDP(n - 3, dp)!;
  int ans = a + b + c;
  dp[n] = (ans % 1000000007);
  return dp[n];
}

int staircase(int n) {
  List<int?> dp = List.filled(n + 1, null);
  return stairCasDP(n, dp)!;
}

void minCounts(int n) {
  int res = double.maxFinite.toInt();
  for (int i = 1; i <= n; i++) {
    if (i * i <= n) {
      res = min(res, minCount(n, i));
    }else {
      break;
    }
  }
  print("res $res");
}

int minCount(int n, int i) {
  if (n <= 0) {
    return 0;
  }
  return 1 + minCount(n - (i * i), i);
}

void main() {
  // DoublyLinkedList<String>? head = takeInput();
  // printDoublyCircularLinkedList(head!);
  // String? value = stdin.readLineSync();
  // int fiboAns = minStepUsingDP(int.parse(value!));
  // print(fiboAns);
 //print(staircase(int.parse(value!)));
 // minCounts(int.parse(value!));

  // LinkedList<int>? linkedList = LinkedList(10);
  // LinkedList<int>? linkedList1 = LinkedList(20);
  // linkedList.next = linkedList1;
  // LinkedList<int> linkedList2 = LinkedList(30);
  // linkedList1.next = linkedList2;

  // while(linkedList != null) {
  //   print(linkedList.data);
  //   linkedList = linkedList.next;
  // }
  //
  //
  // LinkedList<int>? prev = null;
  // LinkedList<int>? curr = linkedList;
  // LinkedList<int>? next = linkedList.next;
  // while(curr != null) {
  //   curr.next = prev;
  //   prev = curr;
  //   curr = next;
  //   if (next != null) {
  //     next = next.next;
  //   }
  // }
  //
  // while(prev != null) {
  //   print(prev.data);
  //   prev = prev.next;
  // }

  // List<int> list = [4,454,2,45,454,45,454,322,2,32,32,3];
  // selectionSort(list);
  // print(list);

  // List<List<String>> board = List.filled(4, List.filled(4, "X", growable: true), growable: true);
  // print(board);
  // NQueen(board, 0);
  HashMap<int> map = HashMap();
  map.insert("Rajwadainindoreisveryfamous", 34);
  print(map.size());
  map.insert("Rahul", 31);
  print(map.size());
  print(map.get("Rajwadainindoreisveryfamous"));
  for (int i = 1; i < 500; i++) {
    map.insert("$i", i);
  }
  print(map.size());
  // print(map.get("5"));
  print("remove ${map.remove("5")}");
  print(map.get("5"));
  map.remove("2");
  map.remove("8");
  print(map.size());
 // map.printBucket();
 //  for (int i = 1; i < 50; i++) {
 //    print(map.get("$i"));
 //  }
  map.printBucket();
  print(map["Rajwadainindoreisveryfamous"]);
  print(map.size());
  print(map.getBucketSize());
  map["Ramukaka"] = 3434;
  print(map["Ramukaka"]);
  print(map.get("Ramukaka"));

  HashMap<List<int>> mapList = HashMap();
  mapList["1"] = [1,3,4];
  mapList["2"] = [5,6,7];
  print(mapList["1"]);
}