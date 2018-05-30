import java.util.Optional;

/**
* Represents a move made by one color
*
* @author aeggart6
* @version 1
*/
public class Ply {

    private Piece piece;
    private Square from;
    private Square to;
    private Optional<String> comment;

    /**
     * Creates a Ply move with hourly wage of 20 and
     *
     * @param p1 piece on the square
     * @param from the square that the piece is moving from
     * @param to the square the piece is moving to
     * @param com comment about the piece
     */
    public Ply(Piece p1, Square from, Square to, Optional<String> com) {
        this.piece = p1;
        this.from = from;
        this.to = to;
        this.comment = com;
    }

    /**
     * Returns the piece value
     * @return the value of piece
     */
    public Piece getPiece() {
        return piece;
    }

    /**
     * Returns the from value
     * @return the value of from
     */
    public Square getFrom() {
        return from;
    }

    /**
     * Returns the to value
     * @return the value of to
     */
    public Square getTo() {
        return to;
    }

    /**
     * Returns the comment value
     * @return the value of comment
     */
    public Optional<String> getComment() {
        return comment;
    }
}