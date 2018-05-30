public class InvalidSquareException extends Exception { // needs to be changed to decide checked vs unchecked exception use Runtime Exception for unchecked
/**
 * Represents an Exception for an invalid square
 *
 * @author aeggart6
 */
    public InvalidSquareException(String msg) {
        super(msg);
    }
}