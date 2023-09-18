
import 'dart:io';

bool isValid(List<List<String>> board, int x, int y) {
  // Up direction checking in the same column
  for (int i = 0; i <= x; i++) {
    if(board[i][y] == "Q") {
      return false;
    }
  }

  for (int i = x, j = y; i >=0 && j >= 0; i--, j--) {
    if (board[i][j] == "Q") {
      return false;
    }
  }

  for (int i = x, j = y; i >= 0 && j < board.length; i--, j++) {
    if (board[i][j] == "Q") {
      return false;
    }
  }
  return true;
}

void NQueen(List<List<String>> board, int row) {
  if (row == board.length) {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        stdout.write(" ${board[i][j]}");
      }
      print("");
    }
    return;
  }

  for (int j = 0; j < board.length; j++) {
    if (isValid(board, row, j)) {
      board[row][j] = "Q";
      NQueen(board, row + 1);
      board[row][j] = "X";
    }
  }
}