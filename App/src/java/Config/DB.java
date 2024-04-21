package Config;

import java.sql.*;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class DB {

    Config config = new Config();

    public Connection conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:" + config.PORT + "/" + config.DB_NAME, "root", "");
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

    public int checkUsername(String username) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT COUNT(*) FROM users WHERE username = '" + username + "'";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count = rs.getInt(1);
            return count;

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int checkEmail(String email) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT COUNT(*) FROM users WHERE email = '" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count = rs.getInt(1);
            return count;

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int checkEmail2(String email, String username) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT * FROM users WHERE email = '" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            int count = 0;
            int foundUser = 0;
            int others = 0;

            while (rs.next()) {
                count++;
                if (username.equals((String) rs.getString("username"))) {
                    foundUser++;
                } else {
                    others++;
                }
            }
            if (others > 0) {
                return 0;
            } else {
                return 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int registerUser(String username, String password, String first_name, String last_name, String gender, String email) {
        String sql = "INSERT INTO users(username, email, password, first_name, last_name, gender) VALUES ('" + username + "', '" + email + "', '" + password + "', '" + first_name + "', '" + last_name + "', '" + gender + "')";
        int x = this.run_sql(sql);
        return x;
    }

    public HashMap loginUser(String username, String password) {
        HashMap<String, String> userMap = new HashMap<>();

        try {
            String sql = "SELECT * FROM users WHERE (username = '" + username + "' AND password = '" + password + "') OR (email = '" + username + "' AND password = '" + password + "');";
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();

            String first_name = rs.getString("first_name");
            String last_name = rs.getString("last_name");
            String _username = rs.getString("username");
            String _email = rs.getString("email");
            String gender = rs.getString("gender");

            userMap.put("username", _username);
            userMap.put("email", _email);
            userMap.put("first_name", first_name);
            userMap.put("last_name", last_name);
            userMap.put("gender", gender);

            if (first_name != null && last_name != null && _username != null && _email != null && gender != null) {
                return userMap;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public HashMap updateUser(String username, String first_name, String last_name, String email, String gender) {
        HashMap<String, String> userMap = new HashMap<>();

        String sql = "UPDATE users SET first_name = '" + first_name + "', last_name = '" + last_name + "', email = '" + email + "', gender = '" + gender + "' WHERE username = '" + username + "';";
        int num = this.run_sql(sql);

        if (num > 0) {
            userMap.put("username", username);
            userMap.put("email", email);
            userMap.put("first_name", first_name);
            userMap.put("last_name", last_name);
            userMap.put("gender", gender);

            return userMap;
        } else {
            return null;
        }
    }

    public ResultSet getProducts() {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `products`");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
