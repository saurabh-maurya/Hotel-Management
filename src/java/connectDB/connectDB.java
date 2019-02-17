
package connectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connectDB {
  
    public static final String USERNAME = "dbtest";//databse username
    public static final String PASSWORD = "root";//database 
    public static final String CONN_STRING =
            "jdbc:mysql://localhost/hotel";
    
    public Connection conn= null;   
    public Statement stmt = null;
    public ResultSet rs;
    public static ResultSet checkLogin = null;
        
    public int connect() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");

        
        try {         
            conn = (Connection) DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            System.out.println("Connection Established !");
            stmt = conn.createStatement();
            return 1;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return 0;
   }    
    public void closeConnection(){
        if(stmt != null){
            try {
                stmt.close();
            } catch (SQLException e) {
                System.out.println("Statement Close Error! ");
                System.out.println(e);
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Connection Close Error! ");
                System.out.println(e);
            }
        }
         
    }
}
