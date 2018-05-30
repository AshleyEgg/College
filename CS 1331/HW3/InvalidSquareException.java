public class InvalidSquareException extends Exception {
/**
 * Represents an Exception for an invalid square
 * I decided to make this a checked expression because it is possilbe that the
 * user could have an invalid square in the file that is being read into the
 * program. Thus it is a problem that needs to addressed by the user so that the
 * piece has a valid square to move to so the game is able to move forward.
 *
 * @author aeggart6
 * @version  2
 */

    /**
     * Creates an InvalidSquareException
     * @param message assoiated with this errorS
     */
    public InvalidSquareException(String msg) {
        super(msg);

    }

}