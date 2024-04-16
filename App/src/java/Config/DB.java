package Config;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB {
    Config config = new Config();
    
    public Connection conn() {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:" + config.PORT + "/" + config.DB_NAME , "root", "");
        return conn;
        
        } catch (ClassNotFoundException | SQLException e) {
        return null;
        }
    }
    
    public int run_sql(String sql) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            int x = stmt.executeUpdate(sql);
            return x;
            
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
}
