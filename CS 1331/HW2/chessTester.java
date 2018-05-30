public class chessTester {
    public static void main(String[] args) throws InvalidSquareException{
        //Hw2 Code Testing
        Piece knight = new Knight(Color.BLACK);
        assert (knight.algebraicName()).equals("N");
        assert knight.fenName().equals("n");
        Square[] attackedSquares = knight.movesFrom(new Square("f6"));
        // test that attackedSquares contains e8, g8, etc.
        Square a1 = new Square("a1");
        Square otherA1 = new Square('a', '1');
        Square h8 = new Square("h8");
        assert a1.equals(otherA1);
        assert !a1.equals(h8);

        //HW3 Code Testing

        try {
            new Square("a1");
            System.out.println("1 works");
        } catch (InvalidSquareException e) {
            System.out.println("InvalidSquareException for valid square: " + e.getMessage());
        }
        try {
            String invalidSquare = "i7";
            new Square(invalidSquare);
            System.out.println("No InvalidSquareException for invalid square: " + invalidSquare);
        } catch (InvalidSquareException e) {
            System.out.println("InvalidSquareException for valid square: " + e.getMessage());
            // Success
        }
        Square s = new Square("f7");
        assert s.getFile() == ('f');
        assert s.getRank() == ('7');
        Square s2 = new Square('e', '4');
        assert s2.toString().equals("e4");
    }


}