import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

public class PgnReader {
    /**
     * Find the tagName tag pair in a PGN game and return its value.
     *
     * @see http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm
     *
     * @param tagName the name of the tag whose value you want
     * @param game a `String` containing the PGN text of a chess game
     * @return the value in the named tag pair
     */
    public static String tagValue(String tagName, String game) {
        String[] lines = game.split("\n", 2);
        if (game.contains(tagName)) {
            int tagLength = tagName.length();
            int start = game.indexOf(tagName) + tagLength + 2;
            String end = game.substring(start);
            String tagPair = game.substring(start, lines[0].length() - 2);
            return tagPair;
        } else {
            return "NOT GIVEN";
        }
    }
    /**
     * Play out the moves in game and return a String with the game's
     * final position in Forsyth-Edwards Notation (FEN).
     *
     * @see http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm#c16.1
     *
     * @param game a `Strring` containing a PGN-formatted chess game or opening
     * @return the game's final position in FEN.
     */
    public static String finalPosition(String game) {
        String[][] currentBoard = makeBoard(); //Makes the board
        String[] lines = game.split("\n", 2);
        String[] moves = lines[1].split("\\d\\.");
        for (int i = 1; i < moves.length; i++) { //For each row of moves
            String[] first = moves[i].split("\\s");
            int temp = moves[i].indexOf(" ", 3);
            if (temp > 0) {
                String wMove = moves[i].substring(1, temp);
                String bMove = moves[i].substring(temp + 1,
                    moves[i].length() - 1);
                currentBoard = makeMove(currentBoard, wMove, "w");
                currentBoard = makeMove(currentBoard, bMove, "b");
            } else { //If white only moves
                String wMove = moves[i].substring(1, moves[i].length() - 1);
                String bMove = ""; //black move is empty
                currentBoard = makeMove(currentBoard, wMove, "w");
            }
        }
        //Formats string in FEN notation
        String out = "";
        int rowCount;
        String curr;
        int emptyCount;
        for (int i = 0; i < currentBoard.length; i++) { //for the entireboard
            rowCount = 0; //num of spaces before a thing
            for (int j = 0; j < currentBoard.length; j++) {
                curr = currentBoard[i][j]; //gets current board value
                switch (curr) {
                case "wR": out = out + "R";
                    break;
                case "wN": out = out + "N";
                    break;
                case "wB": out = out + "B";
                    break;
                case "wQ": out = out + "Q";
                    break;
                case "wK": out = out + "K";
                    break;
                case "wP": out = out + "P";
                    break;
                case "bR": out = out + "r";
                    break;
                case "bN": out = out + "n";
                    break;
                case "bB": out = out + "b";
                    break;
                case "bQ": out = out + "q";
                    break;
                case "bK": out = out + "k";
                    break;
                case "bP": out = out + "p";
                    break;
                case "":
                    while (curr.equals("") && j < 8) {
                        rowCount++;
                        j++;
                        curr = (j < 8) ? currentBoard[i][j] : "L";
                    }
                    out = out + rowCount;
                    rowCount = 0;
                    j = j - 1;
                default : out = out;
                    break;
                }
            }
            out = out + "/";
        }
        return out.substring(0, out.length() - 1);
    }

    /**
     * Reads the file named by path and returns its content as a String.
     *
     * @param path the relative or abolute path of the file to read
     * @return a String containing the content of the file
     */
    public static String fileContent(String path) {
        Path file = Paths.get(path);
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = Files.newBufferedReader(file)) {
            String line = null;
            while ((line = reader.readLine()) != null) {
                // Add the \n that's removed by readline()
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            System.err.format("IOException: %s%n", e);
            System.exit(1);
        }
        return sb.toString();
    }

    public static String[][] makeBoard() { //Makes a starting board
        String board[][] = {//Initilizes the chess board
            {"bR", "bN", "bB", "bQ", "bK", "bB", "bN", "bR"},
            {"bP", "bP", "bP", "bP", "bP", "bP", "bP", "bP"},
            {"", "", "", "", "", "", "", ""},
            {"", "", "", "", "", "", "", ""},
            {"", "", "", "", "", "", "", ""},
            {"", "", "", "", "", "", "", ""},
            {"wP", "wP", "wP", "wP", "wP", "wP", "wP", "wP"},
            {"wR", "wN", "wB", "wQ", "wK", "wB", "wN", "wR"},
        };
        return board;
    }

    public static String[][] makeMove(String[][] currentBoard, String move,
        String color) {
        //white is on bottom and black is on top
        int len = move.length();
        char first = move.charAt(0);
        char second = move.charAt(1);
        if (Character.isUpperCase(first)) { //if first letter is capital
            switch (first) { //Determines which piece needs to be moved
            case 'K' : currentBoard = moveKing(currentBoard, move.substring(1),
                color);
                break;
            case 'Q' : currentBoard = moveQueen(currentBoard, move.substring(1),
                color);
                break;
            case 'N' : currentBoard = moveKnight(currentBoard,
                move.substring(1), color);
                break;
            case 'B' : currentBoard = moveBishop(currentBoard,
                move.substring(1), color);
                break;
            case 'R' : currentBoard = moveRook(currentBoard,
                move.substring(1), color);
                break;
            default : currentBoard  = currentBoard;
            }
        } else { //if first letter is not capital meaning we need to move pawn
            currentBoard = movePawn(currentBoard, move, color);
        }
        return currentBoard;
    }

    public static String[][] moveRook(String[][] currentBoard, String move,
        String color) {
        //Works to find correct starting row or col
        char start = ' ';
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        int startCol = 8;
        int startRow = 8;
        if (second == 'x') { //If capture was made and has a starting location
            start = first; //Initilizes starting place value
            first = move.charAt(3); //Redefines the first and second move
            second = move.charAt(4);
        } else if (first == 'x') { //if capture was made but no starting positon
            first = move.charAt(2); //redefines first and second
            second = move.charAt(3);
        }
        if (Character.isLetter(start)) { //If start is a letter
            switch (start) {
            case 'a': startCol = 0;
                break;
            case 'b': startCol = 1;
                break;
            case 'c': startCol = 2;
                break;
            case 'd': startCol = 3;
                break;
            case 'e': startCol = 4;
                break;
            case 'f': startCol = 5;
                break;
            case 'g': startCol = 6;
                break;
            case 'h': startCol = 7;
                break;
            default : startCol = 8;
            }
        } else if (Character.isDigit(start)) { //If start is a digit
            startRow = 8 - Character.getNumericValue(second);
        }
        //Puts a piece in the correct place
        int col = 0;
        switch (first) { //uses first letter to figure out the column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
        }
        int row = 8 - Character.getNumericValue(second); //gets array row
        currentBoard[row][col] = color + "R"; //puts piece in the right place
        //Works to remove the correct Rook
        int rowCounter = 0;
        int colCounter = 0;
        String current = ""; //initilizes the first value
        if (startCol == 8 && startRow == 8) { //If no start col or row given
            while (!current.equals(color + "R") && rowCounter < 8
                && rowCounter >= 0) {
                current = (rowCounter != row)
                    ? currentBoard[rowCounter][col] : "";
                rowCounter++;
            }
            while (!current.equals(color + "R") && colCounter < 8
                && colCounter >= 0) {
                current = (colCounter != col)
                    ? currentBoard[row][colCounter] : "";
                colCounter++;
            }
            currentBoard[rowCounter - 1][colCounter - 1] = "";
        } else if (startCol != 8 && startRow == 8) { //If a startCol was given
            while (!current.equals(color + "R") && rowCounter < 8
                && rowCounter >= 0) {
                current = (rowCounter != row)
                    ? currentBoard[rowCounter][startCol] : "";
                rowCounter++;
            }
            currentBoard[rowCounter - 1][startCol] = "";
        } else if (startRow != 8 && startCol == 8) { //If a startRow was given
            while (!current.equals(color + "R") && colCounter < 8
                && colCounter >= 0) {
                current = (colCounter != col)
                    ? currentBoard[startRow][colCounter] : "";
                colCounter++;
            }
            currentBoard[startRow][colCounter - 1] = "";
        }
        return currentBoard;
    }
    public static String[][] moveKnight(String[][] currentBoard, String move,
        String color) {
        //Works to find correct starting row or col
        char start = ' ';
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        int startCol = 8;
        int startRow = 8;
        if (second == 'x') { //If capture was made and has a starting location
            start = first; //Initilizes starting place value
            first = move.charAt(2); //Redefines the first and second move
            second = move.charAt(3);
        } else if (first == 'x') { //if capture was made but no start positon
            first = move.charAt(1); //redefines first and second
            second = move.charAt(2);
        }
        if (Character.isLetter(start)) { //If start is a letter
            switch (start) {
            case 'a': startCol = 0;
                break;
            case 'b': startCol = 1;
                break;
            case 'c': startCol = 2;
                break;
            case 'd': startCol = 3;
                break;
            case 'e': startCol = 4;
                break;
            case 'f': startCol = 5;
                break;
            case 'g': startCol = 6;
                break;
            case 'h': startCol = 7;
                break;
            default : startCol = 8;
                break;
            }
        } else if (Character.isDigit(start)) { //If start is a digit
            startRow = 8 - Character.getNumericValue(second);
        }
        //Puts a piece in the correct place
        int col = 0;
        switch (first) { //uses first letter to figure out column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
            break;
        }
        int row = 8 - Character.getNumericValue(second); //gets array row
        currentBoard[row][col] = color + "N"; //put piece in the right place
        //Works to remove the correct Rook
        if (startCol == 8 && startRow == 8) { //If no startCol or row given
            int[][] options = {//Options for locations of knight
                {row - 2, row - 2, row + 2, row + 2,
                    row + 1, row + 1, row - 1, row - 1},
                {col + 1, col - 1, col + 1, col - 1,
                    col + 2, col - 2, col + 2, col - 2}
            };
            int counter = 0;
            String current = "";
            while (!current.equals(color + "N") && counter < 8) {
                if (options[0][counter] >= 0 && options[0][counter] < 8
                    && options[1][counter] >= 0 && options[1][counter] < 8) {
                    current = currentBoard[options[0][counter]]
                    [options[1][counter]];
                    counter++; //increments counter
                }
            }
            currentBoard[options[0][counter - 1]][options[1][counter - 1]] = "";
        } else if (startCol != 8 && startRow == 8) { //If a startCol was given
            int[] options = {row - 2, row + 2, row + 1, row - 1};
            int counter = 0;
            String current = "";
            while (!current.equals(color + "N") && counter < 4) {
                if (options[counter] >= 0 && options[counter] < 8) {
                    current = currentBoard[options[counter]][startCol];
                    counter++; //increments counter
                }
            }
            currentBoard[options[counter - 1]][startCol] = "";
        } else if (startRow != 8 && startCol == 8) { //If startTow was given
            int[] options = {col - 2, col + 2, col + 1, col - 1};
            int counter = 0;
            String current = "";
            while (!current.equals(color + "N") && counter < 4) {
                if (options[counter] >= 0 && options[counter] < 8) {
                    current = currentBoard[startRow][options[counter]];
                    counter++; //increments counter
                }
                currentBoard[startRow][options[counter - 1]] = "";
            }
        }
        return currentBoard;
    }
    public static String[][] moveBishop(String[][] currentBoard, String move,
        String color) {
        char start = ' ';
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        int startCol = 8;
        int startRow = 8;
        if (second == 'x') { //If capture was made and has a starting location
            start = first; //Initilizes starting place value
            first = move.charAt(3); //Redefines the first and second move
            second = move.charAt(4);
        } else if (first == 'x') { //if capture was made but no starting pos
            first = move.charAt(2); //redefines first and second
            second = move.charAt(3);
        }
        if (Character.isLetter(start)) { //If start is a letter
            switch (start) {
            case 'a': startCol = 0;
                break;
            case 'b': startCol = 1;
                break;
            case 'c': startCol = 2;
                break;
            case 'd': startCol = 3;
                break;
            case 'e': startCol = 4;
                break;
            case 'f': startCol = 5;
                break;
            case 'g': startCol = 6;
                break;
            case 'h': startCol = 7;
                break;
            default : startCol = 8;
            }
        } else if (Character.isDigit(start)) { //If start is a digit
            startRow = 8 - Character.getNumericValue(second);
        }
        int col = 0;
        switch (first) { //uses first letter to figure out the column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
         break;
        }
        int row = 8 - Character.getNumericValue(second); //gets correct row
        String current = "";
        if (startCol == 8 && startRow == 8) { //If no startCol or startRow given
            if ((row + col) % 2 == 0) { //Bishop is on a white square
                for (int i = 0; i < 8; i++) { //For all white spaces on board
                    for (int j = 0; j < 8; j++) {
                        current = currentBoard[i][j];
                        if (current.equals(color + "B") && (i + j) % 2 == 0) {
                            currentBoard[i][j] = ""; //Remove that bishop
                            break;
                        }
                    }
                }
            } else if ((row + col) % 2 == 1) { //Bishop is on a black square
                for (int i = 1; i < 8; i++) { //For all black spaces on board
                    for (int j = 1; j < 8; j++) {
                        current = currentBoard[i][j];
                        if (current.equals(color + "B") && (i + j) % 2 == 1) {
                            break;
                        }
                    }
                }
            }
        } else if (startCol != 8 && startRow == 8) { //If a startCol was given
            if ((row + col) % 2 == 0) { //Bishop is on a white square
                for (int i = 0; i < 8; i++) { //For all the spaces in the col
                    if (startCol % 2 == 0) { //If even startCol
                        current = currentBoard[i][startCol];
                        if (current.equals(color + "B") && i % 2 == 0) {
                            currentBoard[i][startCol] = ""; //Remove that bishop
                            break;
                        }
                    } else if (startCol % 2 == 1) { //If odd startCol
                        current = currentBoard[i][startCol];
                        if (current.equals(color + "B") && i % 2 == 1) {
                            currentBoard[i][startCol] = ""; //Remove bishop
                            break;
                        }
                    }
                }
            } else if ((row + col) % 2 == 1) { //Bishop is on a black square
                for (int i = 1; i < 8; i++) { //For all the spaces in the col
                    if (startCol % 2 == 0) { //If even startCol
                        current = currentBoard[i][startCol];
                        if (current.equals(color + "B") && i % 2 == 1) {
                            currentBoard[i][startCol] = ""; //Remove bishop
                            break;
                        }
                    } else if (startCol % 2 == 1) { //If odd startCol
                        current = currentBoard[i][startCol];
                        if (current.equals(color + "B") && i % 2 == 0) {
                            currentBoard[i][startCol] = ""; //Remove bishop
                            break;
                        }
                    }
                }
            }
        } else if (startRow != 8 && startCol == 8) { //If a startRow
            if ((row + col) % 2 == 0) { //Bishop is on a white square
                for (int i = 0; i < 8; i++) { //For all the spaces in the col
                    if (startRow % 2 == 0) { //If even startRow
                        current = currentBoard[startRow][i];
                        if (current.equals(color + "B") && i % 2 == 0) {
                            currentBoard[startRow][i] = ""; //Remove  bishop
                            break;
                        }
                    } else if (startRow % 2 == 1) { //If odd startRow
                        current = currentBoard[startRow][i];
                        if (current.equals(color + "B") && i % 2 == 1) {
                            currentBoard[startRow][i] = ""; //Remove bishop
                            break;
                        }
                    }
                }
            } else if ((row + col) % 2 == 1) { //Bishop is on a black square
                for (int i = 1; i < 8; i++) { //For all the spaces in the col
                    if (startRow % 2 == 0) { //If even startRow
                        current = currentBoard[startRow][i];
                        if (current.equals(color + "B") && i % 2 == 1) {
                            currentBoard[startRow][i] = ""; //Remove bishop
                            break;
                        }
                    } else if (startRow % 2 == 1) { //If odd startRow
                        current = currentBoard[startCol][i];
                        if (current.equals(color + "B") && i % 2 == 0) {
                            currentBoard[startCol][i] = ""; //Remove bishop
                            break;
                        }
                    }
                }
            }
        }
        currentBoard[row][col] = color + "B"; //puts piece in the right place
        return currentBoard;
    }
    public static String[][] moveQueen(String[][] currentBoard, String move,
        String color) {
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        if (first == 'x') { //if capture was made
            first = move.charAt(2); //redefine first and second to move pair
            second = move.charAt(3);
        }
        //Puts a piece in the correct place
        int col = 0;
        switch (first) { //uses first letter to figure out the column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
        }
        int row = 8 - Character.getNumericValue(second); //gets right array row
        //Works to remove the old queen
        String current;
        for (int i = 0; i < 8; i++) { //Searches board for queen
            for (int j = 0; j < 8; j++) {
                current = currentBoard[i][j];
                if (current.equals(color + "Q")) { //If we find correct queen
                    currentBoard[i][j] = ""; //Remove the queen
                    break;
                }
            }
        }
        currentBoard[row][col] = color + "Q"; //puts piece in the right place
        return currentBoard;
    }
    public static String[][] moveKing(String[][] currentBoard, String move,
        String color) {
        //Works to find correct starting row or col
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        if (first == 'x') { //if capture was made
            first = move.charAt(2); //redefines first and second move pair
            second = move.charAt(3);
        }
        //Puts a piece in the correct place
        int col = 0;
        switch (first) { //uses first letter to figure out the column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
        }
        int row = 8 - Character.getNumericValue(second); //get correct array row
        currentBoard[row][col] = color + "K"; //puts piece in the right place
        //Removes the old king
        int[][] options = {//Options for locations of king
            {row, row, row + 1, row + 1, row + 1, row + 1, row - 1, row - 1},
            {col + 1, col - 1, col, col, col + 1, col - 1, col + 1, col - 1}
        };
        int counter = 1;
        String current = currentBoard[options[0][0]][options[1][0]];
        while (!current.equals(color + "K") && counter < 8) {
            if (options[0][counter] >= 0 && options[0][counter] < 8
                && options[1][counter] >= 0 && options[1][counter] < 8) {
                current = currentBoard[options[0][counter]]
                                      [options[1][counter]];
                counter++; //increments counter
            }
        }
        currentBoard[options[0][counter - 1]][options[1][counter - 1]] = "";
        return currentBoard;
    }

    public static String[][] movePawn(String[][] currentBoard, String move,
        String color) { //Should work
        //Works to find correct starting row or col
        char start = ' ';
        char first = move.charAt(0); //Gets first letter
        char second = move.charAt(1); //Gets second letter
        int startCol = 8;
        int startRow = 8;
        if (second == 'x') { //If a capture was made and has a starting location
            start = first; //Initilizes starting place value
            first = move.charAt(2); //Redefines the first and second
            second = move.charAt(3); // to be the actual move pair
        } else if (first == 'x') { //if capture but no starting positon
            first = move.charAt(2); //redefines first and second to be move pair
            second = move.charAt(3);
        }
        if (Character.isLetter(start)) { //If start is a letter
            switch (start) {
            case 'a': startCol = 0;
                break;
            case 'b': startCol = 1;
                break;
            case 'c': startCol = 2;
                break;
            case 'd': startCol = 3;
                break;
            case 'e': startCol = 4;
                break;
            case 'f': startCol = 5;
                break;
            case 'g': startCol = 6;
                break;
            case 'h': startCol = 7;
                break;
            default : startCol = 8;
                break;
            }
        } else if (Character.isDigit(start)) { //If start is a digit
            startRow = 8 - Character.getNumericValue(second);
        }
        //Puts a piece in the correct place
        int col;
        switch (first) { //uses first letter to figure out the column it is in
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
            break;
        }
        int row = 8 - Character.getNumericValue(second); //get correct array row
        currentBoard[row][col] = color + "P"; //Put piece in the right place

        //Works to remove the correct pawn
        if (startCol == 8 && startRow == 8) { //If no startCol or startRow
            if (color.equals("w")) { //If it is white
                String current = currentBoard[7][col];
                int counter = 7;
                while (!current.equals(color + "P") && counter >= 0) {
                    counter--;
                    current = currentBoard[counter][col];
                }
                currentBoard[counter][col] = "";
            } else { //If it was blacks turn
                String current = currentBoard[0][col];
                int counter = 0;
                while (!current.equals(color + "P") && counter <= 7) {
                    counter++;
                    current = currentBoard[counter][col];
                }
                currentBoard[counter][col] = "";
            }
        } else if (startCol != 8 && startRow == 8) { //If a startCol was given
            if (color.equals("w")) { //If it is white
                String current = currentBoard[row][startCol];
                int counter = 7;
                while (!current.equals(color + "P") && counter >= 0) {
                    counter--;
                    current = currentBoard[counter][startCol];
                }
                currentBoard[counter][startCol] = "";
            } else { //If it was blacks turn
                String current = currentBoard[0][startCol];
                int counter = 0;
                while (!current.equals(color + "P") && counter <= 7) {
                    counter++;
                    current = currentBoard[counter][startCol];
                }
                currentBoard[counter][col] = "";
            }
        } else if (startRow != 8 && startCol == 8) { //If a startRow was given
            if (color.equals("w")) { //If it is white
                String current = currentBoard[row][startCol];
                int counter = 7;
                while (!current.equals(color + "P") && counter >= 0) {
                    counter--;
                    current = currentBoard[counter][startCol];
                }
                currentBoard[counter][startCol] = "";
            } else { //If it was blacks turn
                String current = currentBoard[0][startCol];
                int counter = 0;
                while (!current.equals(color + "P") && counter <= 7) {
                    counter++;
                    current = currentBoard[counter][startCol];
                }
                currentBoard[counter][col] = "";
            }
        }
        return currentBoard;
    }

    public static void main(String[] args) {
        String game = fileContent(args[0]);
        System.out.format("Event: %s%n", tagValue("Event", game));
        System.out.format("Site: %s%n", tagValue("Site", game));
        System.out.format("Date: %s%n", tagValue("Date", game));
        System.out.format("Round: %s%n", tagValue("Round", game));
        System.out.format("White: %s%n", tagValue("White", game));
        System.out.format("Black: %s%n", tagValue("Black", game));
        System.out.format("Result: %s%n", tagValue("Result", game));
        System.out.println("Final Position:");
        System.out.println(finalPosition(game));

    }
}