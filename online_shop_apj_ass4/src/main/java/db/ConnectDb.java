package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDb {
    private Connection connection=null;
    private final static String host = "jdbc:mysql://localhost:3306/book-shop";
    private final static String user = "akon";
    private final static String password = "19091978Mama";


    public ConnectDb() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host, user, password);

        } catch (SQLException | ClassNotFoundException throwable) {
            throwable.printStackTrace();
        }

    }

    public Connection getConnection() {
        return connection;
    }


}
