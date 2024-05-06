module co.edu.uptc {
    requires javafx.controls;
    requires javafx.fxml;
    requires com.google.gson;

    opens co.edu.uptc to javafx.fxml;
    opens co.edu.uptc.util to com.google.gson;
    opens co.edu.uptc.view to com.google.gson;
    exports co.edu.uptc;
}