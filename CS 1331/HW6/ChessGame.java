import java.util.ArrayList;
import java.util.List;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
* GUI for a chess game
*
* @author aeggart6
* @version 1
*/

public class ChessGame {

    private StringProperty event = new SimpleStringProperty(this, "NA");
    private StringProperty site = new SimpleStringProperty(this, "NA");
    private StringProperty date = new SimpleStringProperty(this, "NA");
    private StringProperty white = new SimpleStringProperty(this, "NA");
    private StringProperty black = new SimpleStringProperty(this, "NA");
    private StringProperty result = new SimpleStringProperty(this, "NA");
    private StringProperty opening = new SimpleStringProperty(this, "NA");
    //private String opening = "NA";
    private List<String> moves;

    /**
     * Creates a chess game with all the necessary fields
     * @param event the title of the event
     * @param site the site of the game
     * @param date the date the game was played
     * @param white the player on white
     * @param black the player on black
     * @param result the result of the game
     */
    public ChessGame(String event, String site, String date, String white,
                     String black, String result) {
        this.event.set(event);
        this.site.set(site);
        this.date.set(date);
        this.white.set(white);
        this.black.set(black);
        this.result.set(result);
        //this.opening.set(setOpening());]
        moves = new ArrayList<String>();
    }

    /**
     * Adds a move to the list of moves
     * @param move the move to add
     */
    public void addMove(String move) {
        moves.add(move);
    }

    /**
     * Gets the move at the indicated index
     * @param n the index of the move
     * @return the move at the index
     */
    public String getMove(int n) {
        return moves.get(n - 1);
    }

    /**
     * Returns the event for the game
     * @return the event for the game
     */
    public String getEvent() {
        return event.get();
    }

    /**
     * Returns the sitw for the game
     * @return the site for the game
     */
    public String getSite() {
        return site.get();
    }

    /**
     * Returns the date for the game
     * @return the date for the game
     */
    public String getDate() {
        return date.get();
    }

    /**
     * Returns the name of the player on white for the game
     * @return the name of the white player for the game
     */
    public String getWhite() {
        return white.get();
    }

    /**
     * Returns the name of the player on black for the game
     * @return the name of the black player for the game
     */
    public String getBlack() {
        return black.get();
    }

    /**
     * Returns the result for the game
     * @return the result for the game
     */
    public String getResult() {
        return result.get();
    }

    /**
     * Returns all the moves for the game
     * @return the moves for the game
     */
    public String getMoves() {
        String hold = "";
        for (String move : moves) {
            hold = hold + move + '\n';

        }
        return hold;
    }

    /**
     * Returns the opening for the game
     * @return the opening for the game
     */
    public String getOpening() {
        setOpening();
        return opening.get();
    }

    private void setOpening() {
        String first = moves.get(0);
        switch (first) {
        case "e4 c5":
            this.opening.set("Sicilian Defence");
            break;
        case "d4 Nf6":
            this.opening.set("Indian Defence");
            break;
        case "d4 d5":
            this.opening.set("Queen's Gambit");
            break;
        case "e4 e5":
            String second = moves.get(1);
            if (second.equals("Nf3 d6")) {
                this.opening.set("Philidor Defence");
                break;
            }
            String third = moves.get(2);
            if (third.equals("Bc4 Bc5")) {
                this.opening.set("Giuoco Piano");
                break;
            } else if (third.equals("Bb5")) {
                this.opening.set("Ruy Lopez");
                break;
            }
        default:
            this.opening.set("NA");
            break;

        }
    }
}
