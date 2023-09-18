import 'dart:collection';
import 'dart:io';

void printDFSGraph(List<List<int>> edges, int n, int sv, List<int> visited) {
  print(sv);
  visited[sv] = 1;
  for (int i = 0; i < n; i++) {
    if (sv == i) continue;
    if (edges[sv][i] == 1) {
      if (visited[i] == 1) continue;
      printDFSGraph(edges, n, i, visited);
    }
  }
}

void printBFSGraph(List<List<int>> edges, int n, int sv, List<int> visited) {
  Queue<int> queue = Queue();
  queue.add(sv);
  visited[sv] = 1;
  while(!queue.isEmpty) {
    int v = queue.removeFirst();
    print(v);
    for (int i = 0; i < n; i++) {
      if (v == i) continue;
      if (edges[v][i] == 1) {
        if (visited[i] == 1) continue;
        queue.add(i);
        visited[i] = 1;
      }
    }
  }
}

bool hasPath(List<List<int>> edges,int n, int sv, int ev, List<int> visited) {
  visited[sv] = 1;
  for (int i = 0; i < n; i++) {
    if (sv == i) continue;
    if (edges[sv][i] == 1) {
      if (visited[i] == 1) continue;
      if (i == ev) return true;
      return hasPath(edges, n, i, ev, visited);
    }
  }
  return false;
}

void main() {

  print("Number of vertices");
  String? v = stdin.readLineSync();
  int n = int.parse(v!);
  print("Number of edges for $v vertices");
  String? e = stdin.readLineSync();

  List<List<int>> edges = List.generate(n,
          (index) => List.generate(n, (index) => 0));
  for (int i = 0; i < int.parse(e!); i++) {
    String? us = stdin.readLineSync();
    int u  = int.parse(us!);
    String? vs = stdin.readLineSync();
    int v  = int.parse(vs!);

    edges[u][v] = 1;
    edges[v][u] = 1;
  }

  List<int> visited = List.generate(n, (index) => 0);
  // for (int i = 0; i < n; i++) {
  //   if (visited[i] == 1) continue;
  //   printBFSGraph(edges, n, i, visited);
  // }
  print(hasPath(edges, n, 0, 7, visited));
}



//0
// 1
// 0
// 2
// 1
// 3
// 1
// 4
// 3
// 4
// 4
// 5
// 5
// 6
// 2
// 6
// 7
// 8
// 7
// 9
// 8
// 10
// 10
// 9