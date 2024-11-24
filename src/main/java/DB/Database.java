package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String DB_ServerName = "LAPTOP-USDT1527";
    private static final String DB_login = "sa";
    private static final String DB_password = "123";
    private static final String DB_databaseName = "Book";
    
    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String DB_URL = "jdbc:sqlserver://" + DB_ServerName + ":1433;" + 
                            "databaseName=" + DB_databaseName + ";" + 
                            "encrypt=true;" + 
                            "trustServerCertificate=true;";
            Connection conn = DriverManager.getConnection(DB_URL, DB_login, DB_password);
            System.out.println("Kết nối thành công!");
            return conn;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return null;
    }

}