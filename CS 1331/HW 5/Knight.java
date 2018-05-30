/**
* Represents a Knight and is a subclass of Piece
*
* @author aeggart6
* @version 1
*/
public class Knight extends Piece {

    /**
     * Creates a Knight based on the color
     * @param c color of the piece
     */
    public Knight(Color c) {
        super(c);
    }

    /**
     * Returns the algebraic name for the Piece
     * @return the algebraic name for a Knight
     */
    public String algebraicName() {
        return "N";
    }

    /**
     * Returns the FEN name for a Knight based on its color
     * @return the FEN notation for a Knight
     */
    public String fenName() {
        return getColor() == Color.WHITE ? "N" : "n";
    }

    /**
     * Creates an array of the possible Squares to move to
     * @param square the Square the Piece is at
     * @return an array of Squares that the Piece can move to
     */
    public Square[] movesFrom(Square square) {
        Square[] sq = new Square[8];
        int counter = 0;
        char rank = square.getRank();
        char file = square.getFile();
        char[] ranks = new char[]{(char) (rank - 2), (char) (rank - 1),
            (char) (rank + 1), (char) (rank + 2)};
        char[] files = new char[]{(char) (file - 2), (char) (file - 1),
            (char) (file + 1), (char) (file + 2)};

        if (isInBoard(files[0], ranks[1])) {
            sq[counter++] = new Square(files[0], ranks[1]);
        }
        if (isInBoard(files[0], ranks[2])) {
            sq[counter++] = new Square(files[0], ranks[2]);
        }
        if (isInBoard(files[1], ranks[0])) {
            sq[counter++] = new Square(files[1], ranks[0]);
        }
        if (isInBoard(files[1], ranks[3])) {
            sq[counter++] = new Square(files[1], ranks[3]);
        }
        if (isInBoard(files[2], ranks[0])) {
            sq[counter++] = new Square(files[2], ranks[0]);
        }
        if (isInBoard(files[2], ranks[3])) {
            sq[counter++] = new Square(files[2], ranks[3]);
        }
        if (isInBoard(files[3], ranks[1])) {
            sq[counter++] = new Square(files[3], ranks[1]);
        }
        if (isInBoard(files[3], ranks[2])) {
            sq[counter++] = new Square(files[3], ranks[2]);
        }

        Square[] full = new Square[counter];
        for (int i = 0; i < counter; i++) {
            full[i] = sq[i];
        }

        return full;
    }
}