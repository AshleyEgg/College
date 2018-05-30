import java.util.List;
import java.util.function.Predicate;
import java.util.ArrayList;

/**
* Represents a full chess game with multiple moves
*
* @author aeggart6
* @version 1
*/

public class ChessGame {
    private List<Move> moves;

    /**
     * Creates Chessgame taking in a List of moves
     * @param moves a list of moves
     */
    public ChessGame(List<Move> moves) {
        this.moves = moves;
    }

    /**
     * Returns the move at the index
     * @param n index of the move to return
     * @return the move at n
     */
    public Move getMove(int n) {
        return moves.get(n);
    }

    /**
     * Returns the list of moves
     * @return the array list moves
     */
    public List<Move> getMoves() {
        return moves;
    }

    /**
     * Returns a list filtered by the Predicate
     * @param filter the predicate to sort the list by
     * @return the filtered list
     */
    public List<Move> filter(Predicate<Move> filter) {
        List<Move> copy = new ArrayList<Move>();
        for (Move move : moves) {
            if (filter.test(move)) {
                copy.add(move);
            }
        }
        return copy;

    }

    /**
     * Returns a list of moves with comments
     * @return the filtered list of moves
     */
    public List<Move> getMovesWithComment() {
        //uses filter with a lambda expression
        return filter(m -> m.getWhitePly().getComment().isPresent()
            || m.getBlackPly().getComment().isPresent());
    }

    /**
     * Returns a list of moves without comments
     * @return the filtered list of moves
     */
    public List<Move> getMovesWithoutComment() {
        return filter(new Predicate<Move>() {
            public boolean test(Move m) {
                return !m.getWhitePly().getComment().isPresent()
                    && !m.getBlackPly().getComment().isPresent();
            }
        });
    }

    /**
     * Returns a list of moves that both move the same piece
     * @param p the piece to check the moves for
     * @return the filtered list of moves
     */
    public List<Move> getMovesWithPiece(Piece p) {
        return filter(findPieces(p));
    }

    private Predicate<Move> findPieces(Piece p) {
        return m -> m.getWhitePly().getPiece().algebraicName()
        .equals(p.algebraicName())
            || m.getBlackPly().getPiece().algebraicName()
            .equals(p.algebraicName());
    }



}