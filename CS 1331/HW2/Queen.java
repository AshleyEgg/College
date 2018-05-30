public class Queen extends Piece {

    public Queen(Color c) { //Queen Constructor
        super(c);
    }

    public String algebraicName() {
        return "Q";
    }

    public String fenName() {
        if (getColor() == Color.WHITE) {
            return algebraicName();
        } else {
            return (algebraicName()).toLowerCase();
        }
    }

    public Square[] movesFrom(Square square) {
        Square[] temp = {square};
        return temp;
    }
}