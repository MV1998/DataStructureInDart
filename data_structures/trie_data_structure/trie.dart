class TrieNode {
  late List<TrieNode?> _children;
  bool? _isWordEnding;
  String? _letter;

  TrieNode(String letter) {
    this._children = List.generate(26, (index) => null);
    this._isWordEnding = false;
    this._letter = letter;
  }
}

class Trie {
  late TrieNode _root;
  Trie() {
    _root = TrieNode("\0");
  }

  int _addWord(TrieNode root, String word) {
    /// Base condition
    if (word.isEmpty) {
      root._isWordEnding = true;
      return 1;
    }
    /// Small Calculation
    int index = word[0].codeUnitAt(0) - ("a".codeUnitAt(0));
    TrieNode? node;

    if (root._children[index] != null) {
      node = root._children[index];
    } else {
      node = TrieNode(word[0]);
      root._children[index] = node;
    }
    /// Recursive Call
    return _addWord(node!, word.substring(1));
  }

  int addWord(String word) {
    if (word.isEmpty) {
      return 0;
    }
    return _addWord(_root, word.toLowerCase());
  }

  bool _searchWord(TrieNode root, String word) {
    if (word.isEmpty && root._isWordEnding!) {
      return true;
    }
    int index = word[0].codeUnitAt(0) - "a".codeUnitAt(0);
    if (root._children[index] != null) {
      return _searchWord(root._children[index]!, word.substring(1));
    }
    return false;
  }

  bool searchWord(String word) {
    if (word.isEmpty) {
      return false;
    }
    return _searchWord(_root, word.toLowerCase());
  }

  int _removeWord(TrieNode root, String word) {
    if (word.isEmpty) {
      root._isWordEnding = false;
      return 1;
    }
    int index = word[0].codeUnitAt(0) - "a".codeUnitAt(0);
    if (root._children[index] != null) {
      int result = _removeWord(root._children[index]!, word.substring(1));
      if (result == 1) {
        for (TrieNode? node in root._children[index]!._children) {
          if (node != null) {
            return result;
          }
        }
        root._children[index] = null;
      }
      return result;
    }
    return 0;
  }

  int removeWord(String word) {
    if (word.isEmpty) {
      return 0;
    }
    return _removeWord(_root, word.toLowerCase());
  }

  List<String> getAllWordStartWith(String word) {
    /// TODO
    return [];
  }
}

/*
1. Word can be in small or capital letters. (Mo, mo)
2.
 */
