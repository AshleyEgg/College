import javafx.application.Application;
import javafx.scene.control.Label;
import javafx.scene.text.Font;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class HelloJfx extends Application { //Constructs an instance of the application class
    @Override
    public void start(Stage stage) { // on a stage
    Label message = new Label("Hello, JavaFX!"); //makes a message
    message.setFont(new Font(100));
    stage.setScene(new Scene(message)); //Makes a secene
    stage.setTitle("Hello");
    stage.show();
    }
}


// for GUIS
//
// Stage- background box
// Scene-what people see
//
// Layouts- how things are layed out on the page
//  BodrerPane- 5 components of the page
//  StackPane- things are stacked on top of each other
//  GridPane-grid with rows and col that you specify
//  HBox - horizontal box
//  VBox - vertical box
