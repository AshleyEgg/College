public class Knight extends Piece {

    public Knight(Color c) { //Knight constructor
        super(c);
    }

    public String algebraicName() {
        return "N";
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