public class King extends Piece {

    public King(Color c) { //Constructor for king
        super(c);
    }

    public String algebraicName() {
        return "K";
    }

    public String fenName() {
        if (getColor() == Color.WHITE) {
            return algebraicName();
        } else {
            return (algebraicName()).toLowerCase();
        }
    }

    public Square[] movesFrom(Square square) {
        Square[] possibleMoves = new Square[0];
        int fileNum = square.fileToRow(); //row
        int rankNum = square.rankToCol(); //col

        int[][] options = {//Options for locations of king
            {fileNum, fileNum, fileNum + 1, fileNum + 1, fileNum + 1, fileNum + 1, fileNum - 1, fileNum - 1},
            {rankNum + 1, rankNum - 1, rankNum, rankNum, rankNum + 1, rankNum - 1, rankNum + 1, rankNum - 1}
        };

        for (int i = 0; i < 8; i++) {
            if (options[0][i] != fileNum && options[1][i] != rankNum) {
                char file = rowToFile(options[0][i]);
                char rank = colToRank(options[1][i]);
                Square hold = new Square(file, rank);
                possibleMoves = possibleMoves.increaseSize(hold);
            }

        }
        return possibleMoves;



    }
}