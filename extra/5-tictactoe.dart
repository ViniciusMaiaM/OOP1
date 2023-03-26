import 'dart:io';

class TicTacToe {
  List<String> board = List.filled(9, ' '); //Initialize the board with empty strings
  String currentPlayer = "X";
  String winner = " ";

  static const List<List<int>> winningCombinations = [ //Passing all the winning combinations
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  //Displays the board
  void displayBoard() {
    print('-------------');
    for (int i = 0; i < 3; i++) {
      String row = '';
      for (int j = 0; j < 3; j++) {
        row += '| ${board[i * 3 + j]} ';
      }
      row += '|';
      print(row);
      print('-------------');
    }
  }

  bool isBoardFull() { //Checks if the board is already full
    for (String cell in board) {
      if (cell == ' ') {
        return false;
      }
    }
    return true;
  }

  bool checkWinner(String player) { //Checks if the player has won
    for (List<int> combination in winningCombinations) {
      if (board[combination[0]] == player &&
          board[combination[1]] == player &&
          board[combination[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void startGame() { //Starts the game
    while (!isBoardFull()) {
      displayBoard();
      print('Player $currentPlayer\'s turn');
      print('Enter a cell number (0-8)');
      int cell = int.parse(stdin.readLineSync()!);
      
      if(cell > 8 || cell < 0){ //Check if the cell number is valid
        print('Invalid cell number. Please enter a different one.');
        continue;
      }

      if (board[cell] != ' ') { //Checks if the cell is already taken
        print('Cell $cell is already taken. Choose a different cell.');
        continue;
      }

      board[cell] = currentPlayer;

      if (checkWinner(currentPlayer)) { //Chechs if the current player has won
        winner = currentPlayer;
        displayBoard();
        print('Player $winner has won!');
        return;
      }

      //Changes the player for the next turn
      currentPlayer = currentPlayer == "X" ? "O" : "X";
    }

    displayBoard();
    print('It\'s a tie!');
  }
}

void main() {
  TicTacToe game = new TicTacToe();
  game.startGame();
}
