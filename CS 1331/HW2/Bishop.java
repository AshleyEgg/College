public class Bishop extends Piece {

    public Bishop(Color c) { //Bishop constructor
        super(c);
    }

    public String algebraicName() {
        return "B";
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