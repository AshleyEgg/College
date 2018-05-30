public class Rook extends Piece {

    public Rook(Color c) {
        super(c);
    }

    public String algebraicName() {
        return "R";
    }

    public String fenName() {
        if (getColor() == Color.WHITE) {
            return algebraicName();
        } else {
            return (algebraicName()).toLowerCase();
        }
    }

    public Square[] movesFrom(Square square) {
        Square[] possibleMoves = new Square[];
        char file = square.getFile();
        char rank = square.getRank();

        for(int i = 1; i <= 8; i++) {
            //needs to make each posssible square then along the row and then along the col and then add them to the array
            Square option1 = new Square(file , (char)(i + '0');
            Square option2 = new Square((char)(i + '0') , rank);
            if(!option1.equals(square) && option2.equals(square)) {
                possibleMoves = increaseSize(possibleMoves, option1);
                possibleMoves = increaseSize(possibleMoves, option2);
            }



        }






        int fileNum = square.fileToRow(); //row
        int rankNum = square.rankToCol(); //col

        return possibleMoves;
    }
}