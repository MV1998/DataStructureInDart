class SuffixTrieNode {
  late List<SuffixTrieNode?> _children;
  String? _letter;

  SuffixTrieNode(String letter) {
    this._children = List.generate(26, (index) => null);
    this._letter = letter;
  }
}

class SuffixTrie {
  late SuffixTrieNode _root;
  SuffixTrie() {
    _root = SuffixTrieNode("\0");
  }

  int _addWord(SuffixTrieNode root, String word) {
    /// Base condition
    if (word.isEmpty) {
      return 1;
    }
    /// Small Calculation
    int index = word[0].codeUnitAt(0) - ("a".codeUnitAt(0));
    SuffixTrieNode? node;

    if (root._children[index] != null) {
      node = root._children[index];
    } else {
      node = SuffixTrieNode(word[0]);
      root._children[index] = node;
    }
    /// Recursive Call
    return _addWord(node!, word.substring(1));
  }

  int addWord(String word) {
    if (word.isEmpty) {
      return 0;
    }
    for (int i = 0; i < word.length; i++) {
      if (!searchWord(word.substring(i))) {
        _addWord(_root, word.substring(i));
      }
    }
    return 1;
  }

  bool _searchWord(SuffixTrieNode root, String word) {
    if (word.isEmpty) {
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

  int _removeWord(SuffixTrieNode root, String word) {
    if (word.isEmpty) {
      return 1;
    }
    int index = word[0].codeUnitAt(0) - "a".codeUnitAt(0);
    if (root._children[index] != null) {
      int result = _removeWord(root._children[index]!, word.substring(1));
      if (result == 1) {
        for (SuffixTrieNode? node in root._children[index]!._children) {
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