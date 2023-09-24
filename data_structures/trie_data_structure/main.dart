import 'dart:io';
import 'suffix_trie.dart';
import 'trie.dart';

void main() {
  Trie trie = Trie();
  printMenu();
  String? input = stdin.readLineSync();
  while(input! != "6") {
    switch(input) {
      case "1":
        print("Enter word to add or q for exit.");
        String? word = stdin.readLineSync();
        while(word! != "q") {
          trie.addWord(word);
          word = stdin.readLineSync();
        }
        break;
      case "2":
        print("Search word or q for exit.");
        String? word = stdin.readLineSync();
        while(word! != "q") {
          trie.searchWord(word);
          word = stdin.readLineSync();
        }
        break;
      case "3":
        print("Delete word or q for exit.");
        String? word = stdin.readLineSync();
        while(word! != "q") {
          trie.removeWord(word);
          word = stdin.readLineSync();
        }
        break;
      case "4":
        print("Auto complete or q for exit.");
        String? word = stdin.readLineSync();
        while(word! != "q") {
          trie.autoComplete(word);
          word = stdin.readLineSync();
        }
        break;
      default:
        print("This option is not available.");
    }
    printMenu();
    input = stdin.readLineSync();
  }
}

void printMenu() {
  print("welcome to Dictionary");
  print("1. Add word");
  print("2. Search word");
  print("3. Delete word");
  print("4. Auto Complete word");
  print("5. Size of dictionary");
  print("6. Exit");
}
