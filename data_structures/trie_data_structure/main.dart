import 'dart:io';
import 'suffix_trie.dart';
import 'trie.dart';

void main() {
  print("Trie Data Structure");
  // Trie trie = Trie();
 // String? word = stdin.readLineSync();
  // trie.addWord(word!);
  // print(trie.searchWord(word));
  // print(trie.removeWord("Hello"));
  // print(trie.searchWord(word));
  // print(trie.searchWord("Hello"))
  SuffixTrie suffixTrie = SuffixTrie();

  // for (int i = 0; i < word!.length; i++) {
  //   if (!suffixTrie.searchWord(word.substring(i))) {
  //     print("Adding to suffix trie ${word.substring(i)}");
  //     suffixTrie.addWord(word.substring(i));
  //   }
  // }
  suffixTrie.addWord("abc");
  suffixTrie.addWord("def");
  suffixTrie.addWord("ghi");
  suffixTrie.addWord("hg");
  print(suffixTrie.searchWord("hi"));
}