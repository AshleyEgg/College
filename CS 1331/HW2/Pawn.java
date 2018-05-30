public class Pawn extends Piece {

    public Pawn(Color c) {
        super(c);
    }

    public String algebraicName() {
        return "";
    }

    public String fenName() {
        if (getColor() == Color.WHITE) {
            return "P";
        } else { //if black
            return "p";
        }
    }

    public Square[] movesFrom(Square square) {
        Square[] temp = {square};
        return temp;
    }
}