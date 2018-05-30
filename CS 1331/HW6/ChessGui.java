import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.binding.Bindings;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
* GUI for a chess game
*
* @author aeggart6
* @version 1
*/

public class ChessGui extends Application {

    /**
     * Creates a stage and scene
     * @param stage the stage to be created by the GUI
     * @return the complete GUI with
     */
    @Override
    public void start(Stage stage) {
        ChessDb chessDb = new ChessDb();
        ObservableList<ChessGame> games =
            FXCollections.observableArrayList(chessDb.getGames());
        TableView<ChessGame> table = createTable(games);

        Button viewButton = new Button("View Game");
        viewButton.setOnAction(e -> {
                ChessGame msg = table.getSelectionModel().getSelectedItem();
                viewDialog(msg);
            });
        viewButton.disableProperty().bind(Bindings
            .isNull(table.getSelectionModel().selectedItemProperty()));

        Button dismissButton = new Button("Dismiss");
        dismissButton.setOnAction(e -> Platform.exit());

        HBox buttonBox = new HBox();
        buttonBox.getChildren().addAll(viewButton, dismissButton);

        VBox vbox = new VBox();
        vbox.getChildren().addAll(table, buttonBox);
        Scene scene = new Scene(vbox);
        stage.setScene(scene);
        stage.setTitle("Chess DB GUI");
        stage.show();

    }

    private TableView<ChessGame> createTable(ObservableList<ChessGame> games) {
        TableView<ChessGame> table = new TableView<ChessGame>();
        table.setItems(games);

        TableColumn<ChessGame, String> eventCol =
            new TableColumn<ChessGame, String>("Event");
        eventCol.setCellValueFactory(new PropertyValueFactory("event"));

        TableColumn<ChessGame, String> siteCol =
            new TableColumn<ChessGame, String>("Site");
        siteCol.setCellValueFactory(new PropertyValueFactory("site"));

        TableColumn<ChessGame, String> dateCol =
            new TableColumn<ChessGame, String>("Date");
        dateCol.setCellValueFactory(new PropertyValueFactory("date"));

        TableColumn<ChessGame, String> whiteCol =
            new TableColumn<ChessGame, String>("White");
        whiteCol.setCellValueFactory(new PropertyValueFactory("white"));

        TableColumn<ChessGame, String> blackCol =
            new TableColumn<ChessGame, String>("Black");
        blackCol.setCellValueFactory(new PropertyValueFactory("black"));

        TableColumn<ChessGame, String> openCol =
            new TableColumn<ChessGame, String>("Opening");
        openCol.setCellValueFactory(new PropertyValueFactory("opening"));

        TableColumn<ChessGame, String> resultCol =
            new TableColumn<ChessGame, String>("Result");
        resultCol.setCellValueFactory(new PropertyValueFactory("result"));

        table.getColumns().setAll(eventCol, siteCol, dateCol,
            whiteCol, blackCol, openCol, resultCol);
        return table;
    }


    private void viewDialog(ChessGame game) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(game.getEvent());
        alert.setHeaderText(String.format("Event: %s%nSite: %s%nDate: "
            + "%s%nWhite: %s%nBlack: %s%nOpening: %s%nResult: %s",
            game.getEvent(), game.getSite(), game.getDate(), game.getWhite(),
            game.getBlack(), game.getOpening(), game.getResult()));
        alert.setContentText(game.getMoves());
        alert.showAndWait();
    }
}