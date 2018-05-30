/**
* Represents a full move with a black and white play
*
* @author aeggart6
* @version 1
*/
public class Move {

    private Ply whitePly;
    private Ply blackPly;

    /**
     * Creates a Move made of a white and black play
     * @param wp a white play
     * @param bp a black play
     */
    public Move(Ply wp, Ply bp) {
        this.whitePly = wp;
        this.blackPly = bp;
    }

    /**
     * Returns whites Ply value
     * @return the value of whitePly
     */
    public Ply getWhitePly() {
        return whitePly;
    }

    /**
     * Returns blacks Ply value
     * @return the value of blackPly
     */
    public Ply getBlackPly() {
        return blackPly;
    }
}