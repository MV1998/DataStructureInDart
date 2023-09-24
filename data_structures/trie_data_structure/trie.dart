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

/// Trie Data Structure are providing these advantages
/// 1. Space Optimization
/// 2. Fast Searching


/// Types of Tries
///
/// 1. Compressed Trie
/// Compressed Trie combines the letter together if there is no further path exists from
/// that letter.
/// Complexity: 1. Grouping and Ungrouping decision is required at every insertion
/// operation.
///
/// 2. Prefix Trie
/// Prefix Trie used to implement dictionary like DS.
/// We have implemented it.
/// It searches exact pattern.
///
/// 3. Suffix Trie
/// Suffix Trie used to implement pattern matching functionality for a word
/// in the document.

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

  void _helper(TrieNode root, List<String> list, String word) {

    if(root._isWordEnding!) {
      list.add(word);
    }

    bool shouldStop = true;
    for (TrieNode? node in root._children) {
      if (node != null) {
        shouldStop = false;
        break;
      }
    }
    if (shouldStop) {
      return;
    }

    for (TrieNode? node in root._children) {
      if (node != null) {
        _helper(node, list, word+node._letter!);
      }
    }
  }

  bool _autoComplete(TrieNode root, String word, String original) {
    if (word.isEmpty) {
      List<String> list = [];
      _helper(root, list, original);
      for (String s in list) {
          print(s);
      }
      return true;
    }
    int index = word[0].codeUnitAt(0) - "a".codeUnitAt(0);
    if (root._children[index] != null) {
     return _autoComplete(root._children[index]!, word.substring(1), original);
    }
    return false;
  }

  void autoComplete(String word) {
    _autoComplete(_root, word, word);
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
}

/*
1. Word can be in small or capital letters. (Mo, mo)
 */
