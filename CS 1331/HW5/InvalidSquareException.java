/**
* An exception thrown if a square is invalid
*
* @author aeggart6
* @version 1
*/
public class InvalidSquareException extends RuntimeException {

    /**
     * Creates an Invalid Square Exception
     * @param square message to be printed out
     */
    public InvalidSquareException(String square) {
        super(square);
    }
}