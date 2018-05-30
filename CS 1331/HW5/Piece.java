/**
* Represents a Piece on a chess board
*
* @author aeggart6
* @version 1
*/
public abstract class Piece {
    private Color color;

    /**
     * Creates a Piece given the color of the piece
     * @param c the color of the piece
     */
    public Piece(Color c) {
        color = c;
    }

    /**
     * Accesses the color of the piece
     * @return the color of the piece
     */
    public Color getColor() {
        return color;
    }
    /**
     * Determines if a Piece is in a valid Square
     * @param file column of the square
     * @param rank row of the square
     * @return true if the Square is in the board
     */
    public boolean isInBoard(char file, char rank) {
        return file >= 'a' && file <= 'h' && rank >= '1' && rank <= '8';
    }

    /**
     * Returns the algebraic name for a Piece
     * @return the algebraic name for a Piece
     */
    public abstract String algebraicName();

    /**
     * Returns the FEN name for a Piece based on its color
     * @return the FEN notation for a piece
     */
    public abstract String fenName();

    /**
     * Creates an Array containing the possible Squares to move to
     * @param square the Square the Piece is at
     * @return an array of Squares that the Piece can move to
     */
    public abstract Square[] movesFrom(Square square);

    /**
     * Returns a String representation of the Piece
     * @return String with the color and class of the piece
     */
    public String toString() {
        return color.toString() + " " + this.getClass();
    }
}