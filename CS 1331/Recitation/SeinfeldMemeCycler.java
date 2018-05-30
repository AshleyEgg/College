import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.layout.VBox;
import javafx.scene.control.Button;
import javafx.geometry.Pos;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import java.util.Random;
import javafx.event.*;

// Class must extend Application to be a JavaFXApplication Class
public class SeinfeldMemeCycler extends Application {

    // Instance variable stores file names for the images
    private final String[] imageNames = {"george.gif", "kramer.gif", "kramer_taxi.gif", "leaving.gif",
                                        "newman.gif", "okay.gif", "pretzels.gif", "whiff.gif", "popcorn.gif",
                                        "mrpitt.gif", "shame.gif", "shocked.gif", "sleep.gif", "gold.gif", "scarykramer.gif"};
    // Instance variable storing the overall stage so we can access it between methods
    private Stage primaryStage;
    /**
     * Called by the init() method upon running a Java Application
     *
     * @param      stage  The primary stage is provided to you by the init() method
     */
    public void start(Stage stage) {
        // Setting our primaryStage variable to the stage given to us by init()
        primaryStage = stage;
        // Retrieving the primary scene (the first thing we want the user to see)
        Scene primaryScene = getPrimaryScene();
        // Setting the title of the stage, basically what the window says on the top left
        primaryStage.setTitle("SeinfeldMemeCycler");
        // Setting the scene
        primaryStage.setScene(primaryScene);
        // Displaying the stage
        primaryStage.show();
    }


    public Scene getPrimaryScene() {
        // Creating a Vertical Box Layout (things are stacked
        // on top of each other) and making everything centered
        VBox myBox = new VBox(15);
        myBox.setAlignment(Pos.CENTER);

        // Creating an Image object and something to hold the image (ImageViewer)
        // so we can view it later
        Image image = new Image(imageNames[0], 400, 400, true, true);
        ImageView imView = new ImageView(image);

        // Creating buttons
        Button myButton = new Button("Click to Change Memes");
        Button sceneButton = new Button("Click to Leave");

        // Setting what the change meme button will do when someone presses it
        myButton.setOnAction(e -> {
            Random rand = new Random();
            int randInt = rand.nextInt(imageNames.length);
            imView.setImage(new Image(imageNames[randInt], 400, 400, true, true));
        });
        // Alternative way to write above code using an anonymous inner class
        // myButton.setOnAction(new EventHandler<Event>() {
        //     public void handle(Event e) {
        //         Random rand = new Random();
        // int randInt = rand.nextInt(imageNames.length);
        // imView.setImage(new Image(imageNames[randInt], 400, 400, true, true));
        //     }
        // })

        // Setting what the leave button will do
        sceneButton.setOnAction(e -> {
            Scene secondaryScene = getSecondaryScene();
            primaryStage.setScene(secondaryScene);
            primaryStage.show();
        });

        // Adding our ImageViewer and Buttons onto the VBox
        myBox.getChildren().addAll(imView, myButton, sceneButton);
        // Actually instantiating the scene with the VBox containing everything
        Scene primaryScene = new Scene(myBox, 450, 450);
        // Returning the scene
        return primaryScene;
    }


    public Scene getSecondaryScene() {
        // Creating a Vertical Box Layout (things are stacked
        // on top of each other) and making everything centered
        VBox myBox2 = new VBox(15);
        myBox2.setAlignment(Pos.CENTER);

        // Creating a button that redirects back to the first scene
        Button sceneButton = new Button("Aww, you left?! Why?? Click to go back!");
        // Actually specifying what pressing the button will do
        sceneButton.setOnAction(e -> {
            Scene primaryScene = getPrimaryScene();
            primaryStage.setScene(primaryScene);
            primaryStage.show();
        });

        // Creating an Image object and an ImageViewer to hold the image
        Image image = new Image("sad.gif", 400, 400, true, true);
        ImageView imView = new ImageView(image);

        // Adding our ImageViewer and Buttons onto the VBox
        myBox2.getChildren().addAll(imView, sceneButton);
        // Actually instantiating the scene with the VBox containing everything
        Scene secondaryScene = new Scene(myBox2, 450, 450);
        // Returning the scene
        return secondaryScene;
    }
}