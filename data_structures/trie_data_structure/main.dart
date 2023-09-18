import 'dart:io';
import 'trie.dart';

void main() {
  print("Trie Data Structure");
  Trie trie = Trie();
  String? word = stdin.readLineSync();
  trie.addWord(word!);
  print(trie.searchWord(word));
  print(trie.removeWord("Hello"));
  print(trie.searchWord(word));
  print(trie.searchWord("Hello"));
}